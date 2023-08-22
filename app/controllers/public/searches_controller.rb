class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
      if params[:item_name]
        @coffee_searches = RecordCoffee.where('item_name LIKE ?', "%#{params[:item_name]}%")
      elsif params[:brand_name]
        @coffee_searches = RecordCoffee.where('brand_name LIKE ?', "%#{params[:brand_name]}%")
      elsif params[:item_name] && params[:brand_name]
        @coffee_searches = RecordCoffee.where('item_name LIKE ? AND brand_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:brand_name]}%")
      end
    else
      if params[:item_name]
        @tea_searches = RecordTeaLeafe.where('item_name LIKE ?', "%#{params[:item_name]}%")
      elsif params[:brand_name]
        @tea_searches = RecordTeaLeafe.where('brand_name LIKE ?', "%#{params[:brand_name]}%")
      elsif params[:item_name] && params[:brand_name]
        @tea_searches = RecordTeaLeafe.where('item_name LIKE ? AND brand_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:brand_name]}%")
      end
    end
  end



#@products = Product.where('price >=? AND price <= ?',params[:price1],params[:price2])

end
