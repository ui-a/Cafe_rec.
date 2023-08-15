class Public::CommentsController < ApplicationController

  def create
    if record_coffee = RecordCoffee.find(params[:record_coffee_id])
      comment = current_user.comments.new(comment_params)
      comment.record_coffee_id = record_coffee.id
      comment.save
      redirect_to record_coffee_path(record_coffee)
    elsif record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      comment = current_user.comments.new(comment_params)
      comment.record_tea_leafe_id = record_tea_leafe.id
      comment.save
      redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
