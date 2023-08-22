class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:favorites]

  def index
    @user = User.find(current_user.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会しました。ご利用ありがとうございました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
