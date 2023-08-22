class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    
    if @range == "Coffee"
      @coffee_searches = RecordCoffee.where('item_name LIKE ? OR brand_name LIKE ?', "%#{ params[:item_name]}%", "%#{params[:brand_name]}%")
    else
      @tea_searches = RecordTeaLeafe.where('item_name LIKE ? OR brand_name LIKE ? ',  "%#{ params[:item_name]}%", "%#{params[:brand_name]}%")
    end
  end



#@products = Product.where('price >=? AND price <= ?',params[:price1],params[:price2])

end
