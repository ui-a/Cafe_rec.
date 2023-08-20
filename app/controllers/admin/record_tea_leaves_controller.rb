class Admin::RecordTeaLeavesController < ApplicationController

  def index
    @record_tea_leaves = RecordTeaLeafe.all
  end

  def show
    @record_tea_leafe = RecordTeaLeafe.find(params[:id])
    @user = User.find(@record_tea_leafe.user[:id])
    @tag_list = @record_tea_leafe.tags.pluck(:name).join(',')
    @record_tea_leafe_tags = @record_tea_leafe.tags
    @comment = Comment.new
  end

  def edit
  end


    private

  def record_tea_leafe_params
    params.require(:record_tea_leafe).permit(

      :item_name,
      :brand_name,
      :price,
      :review,
      :total_star,
      :scent_star,
      :sweet_star,
      :astringency_star,
      :fresh_star,
      :easy_star,
      :release,
      :tag_id,
      :image
    )
  end

end
