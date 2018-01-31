class ClubsController < ApplicationController
  before_action :authenticate_user!

  def page
    @talks = Talk.order("created_at DESC").page(params[:page])
  end

  def update
    user = User.find(current_user.id)
    user.update(club_id: params[:id]) if Club.where(id: params[:id]).first
    redirect_to clubs_path
  end

  def index
    if current_user.club_id
      @talks = Talk.where(club_id: current_user.club_id).order("created_at DESC").page(params[:page])
      @cnt = @talks.count
    else
      @talks = []
    end
  end

  def talk
    if current_user.club_id
      @talk = Talk.new(
        message: params[:msg],
        user_id: current_user.id,
        club_id: current_user.club_id
      )
      @talk.save
      chat_event = current_user.club_id.to_s
      Pusher.trigger('clubchat', "new#{chat_event}", {message: "#{@talk.message} | #{@talk.user.nickname}"})
      render :nothing => true
    end
  end

end
