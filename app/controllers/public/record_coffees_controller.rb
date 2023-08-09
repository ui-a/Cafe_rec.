class Public::RecordCoffeesController < ApplicationController
  def show
  end

  def edit
  end

  def new
    @record_coffee = Record.new
    @categories = Category.all
  end

  def create
    @record_coffee = Record.new(record_coffee_params)
    @record_coffee.user_id = current_user.id
    @categories = Category.all
    tag_list = params[:record][:tag].split(',')
    if @record_coffee.save
      @record_coffee.save_tags(tag_list)
      redirect_to records_coffee_show_path(@record_coffee), notice: "レビューが投稿されました"
    else
      @records = Record.all
      render '/public/records_coffee_new'
    end
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
      :image
    )
  end

end
