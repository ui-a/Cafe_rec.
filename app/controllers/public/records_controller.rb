class Public::RecordsController < ApplicationController

  def index
    @record_coffees = RecordCoffee.all
    @record_tea_leaves = RecordTeaLeafe.all
    @tag_list = Tag.all
  end


end
