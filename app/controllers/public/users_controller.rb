class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @record_coffees = @user.record_coffees.order(created_at: :desc)
    @record_tea_leaves = @user.record_tea_leaves.order(created_at: :desc)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: "ユーザー情報を変更しました"
    else
      render "edit"
    end
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
