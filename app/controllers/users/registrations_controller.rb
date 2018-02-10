# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # user = User.new(
    #   email: params[:email],
    #   nickname: Faker::Name.unique.name.delete(' ').downcase,
    #   password: params[:password],
    #   password_confirmation: params[:password_confirmation]
    # )
    # if user.save
    #   redirect_to '/signin'
    # else
    #   redirect_to :back, notice: "비밀번호가 일치하지 않거나 가입된 회원입니다."
    # end

    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    nickname = params[:user][:nickname].strip.downcase.delete(' ')
    if nickname == "" || nil
      redirect_to :back, notice: "닉네임은 공백을 입력하실수 없습니다." and return
    end
    if nickname.length > 20
      redirect_to :back, notice: "닉네임은 최대 20자까지 입력가능합니다." and return
    end
    if User.find_by(nickname: nickname) && User.find_by(nickname: nickname) != current_user
      redirect_to :back, notice: "이미 해당 닉네임을 사용하는 유저가 있습니다." and return
    end

    user = User.find(current_user.id)
    if params[:user][:current_password]
      if user.valid_password?(params[:user][:current_password])
        if params[:user][:password] && params[:user][:password] != ""
          if params[:user][:password] == params[:user][:password_confirmation]
            user.update(
              nickname: nickname,
              password: params[:user][:password],
              password_confirmation: params[:user][:password],
              is_checked: true
            )
            sign_in(user, :bypass => true)
          else
            redirect_to :back, notice: "바꾸시려는 비밀번호와 Password confirmation이 다릅니다." and return
          end
        else
          user.update(nickname: nickname, is_checked: true)
        end
      else
        redirect_to :back, notice: "현재 비밀번호가 틀립니다." and return
      end
    else
      user.update(nickname: nickname, is_checked: true)
    end
    redirect_to home_index_path, notice: "Information updated"
    # super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  #
  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  #
  # # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  #
  # # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
