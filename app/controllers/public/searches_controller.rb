class Public::SearchesController < ApplicationController

  def search
    @search_params = record_search_params
    #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    
    @range = params[:range]
    if @range == "Coffee"
     @coffee_searches = Search.search(@search_params).joins(:recrod_coffee) 
    #searchモデルのsearchを呼び出し、引数としてparamsを渡している。
    else
      @tea_searches = Search.search(@search_params).joins(:recrod_tea_leafe) 
    end
    
    
    # @range = params[:range]
    # @word = params[:word]
    # if @range == "Coffee"
    #   @record_coffees = RecordCoffee.where('item_name LIKE ?', "%#{@word}%").page(params[:page])
    #   @record_coffees = RecordCoffee.where('brand_name LIKE ?', "%#{@word}%").page(params[:page])
    # else
    #   @record_tea_leaves = RecordTeaLeafe.where('item_name LIKE ?', "%#{@word}%").page(params[:page])
    #   @record_tea_leaves = RecordTeaLeafe.where('brand_name LIKE ?', "%#{@word}%").page(params[:page])
    # end
  end
  
  private

  def record_search_params
    params.fetch(:search, {}).permit(:item_name, :brand_name, :price_from, :price_to)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end
end
