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
    @record_coffee = RecordCoffee.find(params[:id])
    @tag_list = @record_coffee.tags.pluck(:name).join(',')
  end
  
  def update
    @record_coffee = RecordCoffee.find(params[:id])
    tag_list = params[:record_coffee][:tag].split(',')
    if @record_coffee.update(record_coffee_params)
      @record_coffee.save_tags(tag_list)
      redirect_to admin_record_coffee_path(@record_coffee), notice: "変更を保存しました"
    else
      render :edit
    end
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
  
end
