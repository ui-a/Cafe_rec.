class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
      @coffee_searches = RecordCoffee.where('item_name LIKE ? OR brand_name LIKE ?,  params[:item_name], params[:brand_name])
    else
      @tea_searches = RecordTeaLeafe.where('item_name LIKE ? OR brand_name LIKE ? OR price_from LIKE ? OR price_to LIKE ?',  params[:search][:item_name], params[:search][:brand_name], params[:search][:price_from], params[:search][:price_to])
    end
  end



#@products = Product.where('price >=? AND price <= ?',params[:price1],params[:price2])

end
