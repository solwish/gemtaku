# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :configure_permitted_parameters

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    # user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to '/', notice: "로그인에 성공했습니다."
    # else
    #   redirect_to :back, notice: "이메일이 없거나, 비밀번호가 틀렸습니다."
    # end
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
