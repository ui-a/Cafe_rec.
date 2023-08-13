class Public::TagController < ApplicationController

  def search_tag
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @records = @tag.records
  end
end
