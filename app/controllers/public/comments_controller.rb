class Public::CommentsController < ApplicationController

  def create
    if record_coffee = RecordCoffee.find(params[:record_coffee_id])
      coffee_comment = current_user.comments.new(coffee_comment_params)
      coffee_comment.record_coffee_id = record_coffee.id
      coffee_comment.save
      redirect_to record_coffee_path(record_coffee)
    elsif record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      tea_comment = current_user.comments.new(tea_comment_params)
      tea_comment.record_tea_leafe_id = record_tea_leafe.id
      tea_comment.save
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

  def coffee_comment_params
    params.require(:coffee_comment).permit(:comment)
  end

  def tea_comment_params
    params.require(:tea_comment).permit(:comment)
  end

end
