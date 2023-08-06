class Public::RecordsController < ApplicationController

  def index
    @record_coffees = RecordCoffee.all
    @record_tea_leaves = RecordTeaLeave.all

    # それぞれの複数インスタンスを1つの配列にする
    @instances = @record_coffees | @record_tea_leaves
    @instances.sort!{ |a, b| b.created_at <=> a.created_at }
  end
end
