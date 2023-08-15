class Public::RecordsController < ApplicationController

  def index
    record_coffees = RecordCoffee.all
    record_tea_leaves = RecordTeaLeafe.all
    @tag_list = Tag.all

    # それぞれの複数インスタンスを1つの配列にする
    @instances = record_coffees | record_tea_leaves
    # 作成降順（新しい順）に並び替え
    # 作成昇順の場合は、a.created_at <=> b.created_at }
    @instances.sort!{ |a, b| b.created_at <=> a.created_at }
    
    @q = @instances.ransack(params[:q])
    @record_result = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
  
  
end
