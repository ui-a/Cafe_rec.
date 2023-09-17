class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "Coffee"
      @record_searches = RecordCoffee.all
      if params[:item_name]
        @record_searches = @record_searches.where('item_name LIKE ?', "%#{params[:item_name]}%")
      end
      if params[:shop_name]
        @record_searches = @record_searches.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
      end
      # if params[:item_price]
      #   @record = @record.where(....)
      # end
      @record_searches = @record_searches.released.page(params[:page]).per(5)

      # if params[:item_name] && params[:shop_name]
      #   @record_searches = RecordCoffee.where(
      #     'item_name LIKE ? AND shop_name LIKE ?', "%#{params[:item_name]}%", "%#{params[:shop_name]}%").released.page(params[:page]).per(5)
      #   elsif params[:shop_name]
      #   @record_searches = RecordCoffee.where(
      #     'shop_name LIKE ?', "%#{params[:shop_name]}%").released.page(params[:page]).per(5)
      # elsif params[:item_name]
      #   @record_searches = RecordCoffee.where(
      #     'item_name LIKE ?', "%#{params[:item_name]}%").released.page(params[:page]).per(5)
      # end
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

  # def search_price
  #   @products = Product.where('price >=? AND price <=?', params[:price1],params[:price2])
  #   @products = Product.where('price >=?', params[:price1]) if params[:price2].blank?
  #   @products = Product.where('price <=?', params[:price2]) if params[:price1].blank?
  #   render :action => 'index'
  # end


end
