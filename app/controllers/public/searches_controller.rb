class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
     @coffee_searches = RecordCoffee.where('item_name LIKE ? OR brand_name LIKE ? OR price_from LIKE ? OR price_to LIKE ?',  params[:item_name], params[:brand_name], params[:price_from], params[:price_to])
    else
    @tea_searches = RecordTeaLeafe.where('item_name LIKE ? OR brand_name LIKE ? OR price_from LIKE ? OR price_to LIKE ?',  params[:search][:item_name], params[:search][:brand_name], params[:search][:price_from], params[:search][:price_to])
    end
  end

end
