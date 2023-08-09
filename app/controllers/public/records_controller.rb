class Public::RecordsController < ApplicationController

  def index
    @records = Record.all
    @tag_list = Tag.all
  end


end
