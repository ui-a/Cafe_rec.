class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "Coffee"
      @record_coffees = RecordCoffee.where('item_name OR brand_name OR review LIKE ?', "%#{@word}%").page(params[:page])
    else
      @record_tea_leaves = RecordTeaLeafe.where('item_name OR brand_name OR review LIKE ?', "%#{@word}%").page(params[:page])
    end
  end
end
