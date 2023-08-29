class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
      if params[:item_name] && params[:shop_name] 
        @record_searches = RecordCoffee.where(
          'item_name LIKE ? AND shop_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:shop_name]}%").released.page(params[:page]).per(5)
        elsif params[:shop_name]
        @record_searches = RecordCoffee.where(
          'shop_name LIKE ?', "%#{params[:shop_name]}%").released.page(params[:page]).per(5)
      elsif params[:item_name]
        @record_searches = RecordCoffee.where(
          'item_name LIKE ?', "%#{params[:item_name]}%").released.page(params[:page]).per(5)
      end
    else
      if params[:item_name] && params[:shop_name]
        @record_searches = RecordTeaLeafe.where(
          'item_name LIKE ? AND shop_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:shop_name]}%").released.page(params[:page]).per(5)
        elsif params[:shop_name]
        @record_searches = RecordTeaLeafe.where(
          'brand_name LIKE ?', "%#{params[:brand_name]}%").released.page(params[:page]).per(5)
      elsif params[:item_name]
        @record_searches = RecordTeaLeafe.where(
          'item_name LIKE ?', "%#{params[:item_name]}%").released.page(params[:page]).per(5)
      end
    end
  end

end
