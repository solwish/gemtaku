class EscapesController < ApplicationController
  before_action :set_escape, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /escapes
  # GET /escapes.json
  def index
    @escapes = Escape.all.reverse
    @escapes = Kaminari.paginate_array(@escapes).page(params[:page]).per(20).reverse
  end

  # GET /escapes/1
  # GET /escapes/1.json
  def show
    if user_signed_in?
      @join = Join.where(user_id: current_user.id, escape_id: params[:id])
    else
      @join = []
    end
  end

  # GET /escapes/new
  def new
    @escape = Escape.new
  end

  # GET /escapes/1/edit
  def edit
  end

  # POST /escapes
  # POST /escapes.json
  def create
    @escape = current_user.escapes.new(escape_params)

    respond_to do |format|
      if @escape.save
        format.html { redirect_to @escape, notice: 'Escape was successfully created.' }
        format.json { render :show, status: :created, location: @escape }
      else
        format.html { render :new }
        format.json { render json: @escape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escapes/1
  # PATCH/PUT /escapes/1.json
  def update
    respond_to do |format|
      if @escape.update(escape_params)
        format.html { redirect_to @escape, notice: 'Escape was successfully updated.' }
        format.json { render :show, status: :ok, location: @escape }
      else
        format.html { render :edit }
        format.json { render json: @escape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escapes/1
  # DELETE /escapes/1.json
  def destroy
    @escape.destroy
    respond_to do |format|
      format.html { redirect_to escapes_url, notice: 'Escape was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join_escape
    @join = Join.where(user_id: current_user.id, escape_id: params[:escape_id]).first
    unless @join.nil?
      @join.destroy
      puts '참가 취소'
    else
      @join = Join.create(user_id: current_user.id, escape_id: params[:escape_id])
      puts '참여가 완료되었습니다.'
    end
    # redirect_to :back
  end

  def create_comment
    @comment = Comment.new(user_id: current_user.id, escape_id: params[:escape_id], contents: params[:contents])
    @flag = false
    @flag = true if @comment.save
  end


  def  delete_comment
    @comment = Comment.find(params[:comment_id])
    @flag = false
    @flag = true if (@comment.user_id == current_user.id) && @comment.destroy
  end

  def update_comment
    @comment = Comment.find(params[:comment_id])
    @flag = false
    @flag = true if (@comment.user_id == current_user.id) && @comment.update(contents: params[:contents])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escape
      @escape = Escape.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def escape_params
      params.require(:escape).permit(:title, :contents)
    end
end
