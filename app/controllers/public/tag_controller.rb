class Public::TagController < ApplicationController
  before_action :authenticate_user!

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @taggings = Tagging.where(tag_id: params[:tag_id])
    @coffee_taggings = @taggings.where(record_drinkable_type: "RecordCoffee")
    @record_coffees = RecordCoffee.all
  end
  
end
