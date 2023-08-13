class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_guest_user, only: [:index]

  def index
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @suctomer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会しました。ご利用ありがとうございました。'
  end

  private

  # def ensure_guest_user
  #   @user = User.find(params[:id])
  #   if @user.guest_user?
  #     redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
  #   end
  # end


end
