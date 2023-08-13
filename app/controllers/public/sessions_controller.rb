# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :reject_invalid_user, pnly: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "guestuserでログインしました。"
  end
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

  protected
  
  def reject_invalid_user
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password]) && (user.is_deleted == true)
        redirect_to new_user_registration_path, notice: '退会済みです。再度ご登録をしてご利用ください.'
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
