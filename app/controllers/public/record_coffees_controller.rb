class Public::RecordCoffeesController < ApplicationController

  def new
    @record_coffee = RecordCoffee.new
  end

  def create
    @record_coffee = RecordCoffee.new(record_coffee_params)
    @record_coffee.user_id = current_user.id
    if @record_coffee.save
      redirect_to records_path, notice: "レビューが投稿されました"
    else
      @record_coffees = RecordCoffee.all
      render '/public/record_coffees/new'
    end
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
      :image
    )#ここのstar end
  end

end
