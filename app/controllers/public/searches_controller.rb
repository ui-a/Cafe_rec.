class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    min_price = params[:min_price]
    max_price = params[:max_price]
    if @range == "Coffee"
      @record = RecordCoffee.all
      if params[:item_name]
        @record = @record.where('item_name LIKE ?', "%#{params[:item_name]}%")
      if params[:shop_name]
        @record = @record.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
      # 価格絞り込み
      if max_price != '' && max_price != nil && min_price != '' && min_price != nil
            @record = @record.where("price >= #{min_price} and price <= #{max_price}")
        elsif max_price != '' && max_price != nil
            @record = @record.where("price <= #{max_price}")
        elsif min_price != '' && min_price != nil
            @record = @record.where("price >= #{min_price}")
      end
      end
      end
      @record = @record.released.page(params[:page]).per(5)
    else
      @record = RecordTeaLeafe.all
      if params[:item_name]
        @record = @record.where('item_name LIKE ?', "%#{params[:item_name]}%")
        if params[:shop_name]
          @record = @record.where('shop_name LIKE ?', "%#{params[:shop_name]}%")
        # 価格絞り込み
          if max_price != '' && max_price != nil && min_price != '' && min_price != nil
            @record = @record.where("price >= #{min_price} and price <= #{max_price}")
          elsif max_price != '' && max_price != nil
            @record = @record.where("price <= #{max_price}")
          elsif min_price != '' && min_price != nil
            @record = @record.where("price >= #{min_price}")
          end
        end
      end
      @record = @record.released.page(params[:page]).per(5)
    end
  end

end
