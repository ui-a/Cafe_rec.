class Public::RecordTeaLeavesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def index
    if params[:latest]
      @record_tea_leaves = RecordTeaLeafe.latest
    elsif params[:total_star_count]
      @record_tea_leaves = RecordTeaLeafe.star_count
    else
      @record_tea_leaves = RecordTeaLeafe.released.order(created_at: :desc)
    end
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

  def new
    @record_tea_leafe = RecordTeaLeafe.new
  end

  def create
    @record_tea_leafe = RecordTeaLeafe.new(record_tea_leafe_params)
    @record_tea_leafe.user_id = current_user.id
    tag_list = params[:record_tea_leafe][:tag].split(',')
    if @record_tea_leafe.save
      @record_tea_leafe.save_tags(tag_list)
      redirect_to record_tea_leafe_path(@record_tea_leafe), notice: "レビューが投稿されました"
    else
      render :new
    end
  end

  def update
    @record_tea_leafe = RecordTeaLeafe.find(params[:id])
    tag_list = params[:record_tea_leafe][:tag].split(',')
    if @record_tea_leafe.update(record_tea_leafe_params)
      @record_tea_leafe.save_tags(tag_list)
      redirect_to record_tea_leafe_path(@record_tea_leafe), notice: "変更を保存しました"
    else
      render :edit
    end
  end


  def destroy
    record_tea_leafe = RecordTeaLeafe.find(params[:id])
    record_tea_leafe.destroy
    redirect_to records_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @taggings = Tagging.where(tag_id: params[:tag_id])
    @tea_taggings = @taggings.where(record_drinkable_type: "RecordTeaLeafe")
    @record_tea_leaves = @tag.record_tea_leaves
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

  def ensure_correct_user
    record_tea_leafe = RecordTeaLeafe.find(params[:id])
    user = User.find(record_tea_leafe.user[:id])
    unless user.id == current_user.id
      redirect_to record_tea_leaves_path
    end
  end

end
