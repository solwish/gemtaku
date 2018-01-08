class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :phone])
  end

  def authenticate_user!
  # bang => 내용물을 변화시킬 수 있는 메소드에 붙여줌
  # element.upcase! => element자체가 변화함
  # element.upcase => return값이 변화함
  #유저가 로그인 했다면 진행
  #유저가 로그인 하지않았다면 로그인 페이지로
  if session[:user_id].nil?
    redirect_to '/users/sign_in', notice: '로그인이 필요한 서비스입니다.'
  end
end
end
