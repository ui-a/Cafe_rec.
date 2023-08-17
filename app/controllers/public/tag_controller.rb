class Public::TagController < ApplicationController

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @record_coffees = @tag.record_coffees.all
  end
end
