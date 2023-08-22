class Admin::TagController < ApplicationController
   before_action :authenticate_admin!
   
  def index
    @tags = Tag.all
  end

  def edit
  end
end
