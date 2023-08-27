class Public::RecordCoffeesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]

  def index
    if params[:latest]
      @record_coffees = RecordCoffee.latest.released.page(params[:page]).per(5)
    elsif params[:total_star_count]
      @record_coffees = RecordCoffee.total_star_count.released.page(params[:page]).per(5)
    else
      @record_coffees = RecordCoffee.released.order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def show
    @record_coffee = RecordCoffee.find(params[:id])
    @user = User.find(@record_coffee.user[:id])
    @tag_list = @record_coffee.tags.pluck(:name).join(',')
    @record_coffee_tags = @record_coffee.tags
    @comment = Comment.new
  end

  def edit
    @record_coffee = RecordCoffee.find(params[:id])
    @tag_list = @record_coffee.tags.pluck(:name).join(',')
  end

  def new
    @record_coffee = RecordCoffee.new
  end

  def create
    @record_coffee = RecordCoffee.new(record_coffee_params)
    @record_coffee.user_id = current_user.id
    tag_list = params[:record_coffee][:tag].split(',')
    if @record_coffee.save
      @record_coffee.save_tags(tag_list)
      redirect_to record_coffee_path(@record_coffee), notice: "レビューが投稿されました"
    else
      render :new
    end
  end

  def update
    @record_coffee = RecordCoffee.find(params[:id])
    tag_list = params[:record_coffee][:tag].split(',')
    if @record_coffee.update(record_coffee_params)
      @record_coffee.save_tags(tag_list)
      redirect_to record_coffee_path(@record_coffee), notice: "変更を保存しました"
    else
      render :edit
    end
  end


  def destroy
    record_coffee = RecordCoffee.find(params[:id])
    record_coffee.destroy
    redirect_to records_path
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @taggings = Tagging.where(tag_id: params[:tag_id])
    @coffee_taggings = @taggings.where(record_drinkable_type: "RecordCoffee")
    @record_coffees = @tag.record_coffees.released.page(params[:page]).per(5)
  end

  private

  def record_coffee_params
    params.require(:record_coffee).permit(
      :item_name,
      :shop_name,
      :price,
      :review,
      :total_star,
      :scent_star,
      :bitter_star,
      :acidity_star,
      :sweet_star,
      :rich_star,
      :release,
      :tag_id,
      :image
    )
  end

  def ensure_correct_user
    record_coffee = RecordCoffee.find(params[:id])
    user = User.find(record_coffee.user[:id])
    unless user.id == current_user.id
      redirect_to record_coffees_path
    end
  end

end
