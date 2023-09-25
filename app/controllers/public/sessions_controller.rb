# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_invalid_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to record_coffees_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def after_sign_in_path_for(resource)
    record_coffees_path
  end

  def after_sign_up_path_for(resource)
    record_coffees_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected

  def reject_invalid_user
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password]) && (user.is_deleted == true)
        redirect_to new_user_registration_path, notice: '退会済みです。再度ご登録をしてご利用ください。'
      else
        flash[:notice] = "入力情報が正しくありません"
      end
    else
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
