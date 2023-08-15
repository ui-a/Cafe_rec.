class GuestUsers::SessionsController < Devise::SessionsController
  def guest_sign_in
    guest_user = GuestUser.guest
    sign_in guest_user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
  
end