class Search < ApplicationRecord

  belongs_to :record_coffee, optional: true
  belongs_to :record_tea_leafe, optional: true

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

    item_name_like(search_params[:item_name])
      .brand_name_like(search_params[:brand_name])
      .price_from(search_params[:price_from])
      .price_to(search_params[:price_to])   #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end


  scope :item_name_like, -> (item_name) { where('item_name LIKE ?', "%#{item_name}%") if item_name.present? }  #scopeを定義。
  scope :brand_name_like, -> (brand_name) { where('brand_name LIKE ?', "%#{brand_name}%") if brand_name.present? }
  scope :price_from, -> (from) { where('? <= price', from) if from.present? }
  scope :price_to, -> (to) { where('price <= ?', to) if to.present? }
  #価格の範囲検索をするため、fromとtoをつけている
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない


end
