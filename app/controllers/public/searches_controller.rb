class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
      if params[:item_name] && params[:shop_name] &&
        @coffee_searches = RecordCoffee.where('item_name LIKE ? AND shop_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:shop_name]}%")
        elsif params[:shop_name]
        @coffee_searches = RecordCoffee.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
      elsif params[:item_name]
        @coffee_searches = RecordCoffee.where('item_name LIKE ?', "%#{params[:item_name]}%")
      end
    else
      if params[:item_name] && params[:shop_name]
        @tea_searches = RecordTeaLeafe.where('item_name LIKE ? AND shop_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:shop_name]}%")
        elsif params[:shop_name]
        @tea_searches = RecordTeaLeafe.where('brand_name LIKE ?', "%#{params[:brand_name]}%")
      elsif params[:item_name]
        @tea_searches = RecordTeaLeafe.where('item_name LIKE ?', "%#{params[:item_name]}%")
      end
    end
  end

end
