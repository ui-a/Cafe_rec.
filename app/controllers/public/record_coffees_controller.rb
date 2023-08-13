class Public::RecordCoffeesController < ApplicationController

  def show
    @record_coffee = RecordCoffee.find(params[:id])
    @user = User.find(@record_coffee.user[:id])
    @tag_list = @record_coffee.tags
    @coffee_comment = Comment.new
  end

  def edit
  end

  def new
    @record_coffee = RecordCoffee.new
    @categories = Category.all
  end

  def create
    @record_coffee = RecordCoffee.new(record_coffee_params)
    @record_coffee.user_id = current_user.id
    @categories = Category.all
    tag_list = params[:record_coffee][:tag].split(',')
    if @record_coffee.save
      @record_coffee.save_tags(tag_list)
      redirect_to record_coffee_path(@record_coffee), notice: "レビューが投稿されました"
    else
      render '/records_coffee_new'
    end
  end

  def destroy
    record_coffee = RecordCoffee.find(params[:id])
    record_coffee.destroy
    redirect_to records_path
  end

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @record_coffees = @tag.record_coffees
  end


  private

  def record_coffee_params
    params.require(:record_coffee).permit(
      :category_id,
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
      :tagging,
      :image
    )
  end


end
