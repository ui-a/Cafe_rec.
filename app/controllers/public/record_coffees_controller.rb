class Public::RecordCoffeesController < ApplicationController
  before_action :authenticate_user!

  def index
    @record_coffees = RecordCoffee.all.order(created_at: :desc)
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
    @record_coffees = @tag.record_coffees
  end

  private

  def record_coffee_params
    params.require(:record_coffee).permit(
      :item_name,
      :brand_name,
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


end
