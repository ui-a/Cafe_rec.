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
    @record_tea_leafe = RecordTeaLeafe.find(params[:id])
    @tag_list = @record_tea_leafe.tags.pluck(:name).join(',')
  end

  def update
    @record_tea_leafe = RecordTeaLeafe.find(params[:id])
    tag_list = params[:record_tea_leafe][:tag].split(',')
    if @record_tea_leafe.update(record_tea_leafe_params)
      @record_tea_leafe.save_tags(tag_list)
      redirect_to admin_record_tea_leafe_path(@record_tea_leafe), notice: "変更を保存しました"
    else
      render :edit
    end
  end


    private

  def record_tea_leafe_params
    params.require(:record_tea_leafe).permit(

      :item_name,
      :shop_name,
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
