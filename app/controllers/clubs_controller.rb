class ClubsController < ApplicationController
  before_action :authenticate_user!

  def update
    # user = User.find(current_user.id)
    # user.update(club_id: params[:id])
    # render clubs_path
  end

  def index
    if current_user.club_id
      @talks = Talk.where(club_id: current_user.club_id).reverse
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
