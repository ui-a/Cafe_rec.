class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]

  def create
    @comment = Comment.new
    if params[:record_coffee_id].present?
      @record_coffee = RecordCoffee.find(params[:record_coffee_id])
      comment = current_user.comments.new(comment_params)
      comment.record_drinkable = @record_coffee
      comment.save
      #redirect_to record_coffee_path(record_coffee)
    elsif params[:record_tea_leafe_id].present?
      @record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      comment = current_user.comments.new(comment_params)
      comment.record_drinkable = @record_tea_leafe
      comment.save
      #redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end

  def destroy
    @comment = Comment.new
    if params[:record_coffee_id].present?
      @record_coffee = RecordCoffee.find(params[:record_coffee_id])
    elsif params[:record_tea_leafe_id].present?
      @record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
    end
    Comment.find(params[:id]).destroy
    #redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def ensure_correct_user
    comment = Comment.find(params[:id])
    user = User.find(comment.user[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end

end
