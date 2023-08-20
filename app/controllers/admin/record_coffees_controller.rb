class Admin::RecordCoffeesController < ApplicationController
  
  
  def index
    @record_coffees = RecordCoffee.all
  end

  def show
    @record_coffee = RecordCoffee.find(params[:id])
    @user = User.find(@record_coffee.user[:id])
    @tag_list = @record_coffee.tags.pluck(:name).join(',')
    @record_coffee_tags = @record_coffee.tags
    @comment = Comment.new
  end

  def edit
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
