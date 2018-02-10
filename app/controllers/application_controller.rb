class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user!, except: [:edit, :destroy, :update]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 어드민인지 체크
  # cancancan으로 대체
  # def check_admin
  #   user_signed_in? && current_user.is_admin?
  # end

  # 가게 정보 올리기 위한 before_action
  # def check_admin_for_shop
  #   redirect_to root_path unless check_admin
  # end

  # helper_method :check_admin

  def check_user!
    if current_user && current_user.is_checked == false
      redirect_to edit_user_registration_path, notice: '추가정보를 입력해 주세요.'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :nickname, :gender, :club_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password, :nickname])
  end


end
