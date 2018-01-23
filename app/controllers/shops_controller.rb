class ShopsController < ApplicationController
  # before_action :check_admin_for_shop, except: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def review
    if ShopReview.where(shop_id: params[:id], user_id: current_user.id).first.nil?
      @review = ShopReview.new(
        rating: params[:rating],
        comment: params[:comment],
        user_id: current_user.id,
        shop_id: params[:id]
      )
      @flag = true if @review.save
    else
      @flag = false
    end
    # redirect_to :back
  end

  def region
    @shop = Shop.where(region: params[:region])
    @shop = Shop.all if params[:region] == "전체"
    render 'index'
  end
  # GET /shops
  # GET /shops.json
  def index
    @shop = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shop_attachment = @shop.shop_attachments.all
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    @shop_attachment = @shop.shop_attachments.build
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)

    respond_to do |format|
      if @shop.save
        unless params[:shop_attachments].nil?
          params[:shop_attachments]['avatar'].each do |a|
            @shop_attachment = @shop.shop_attachments.create!(avatar: a)
          end
        end
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        unless params[:shop_attachments].nil?
          @shop.shop_attachments.each(&:destroy) if @shop.shop_attachments.present?
          params[:shop_attachments]['avatar'].each do |a|
            @shop_attachment = @shop.shop_attachments.create!(avatar: a)
          end
        end
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:title, :content, :region, :address, shop_attachments_attributes: [:id, :shop_id, :avatar])
    end
end
