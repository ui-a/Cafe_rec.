class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    if @range == "Coffee"
      @record_coffees = RecordCoffee.looks(params[:search], params[:word])
    else
      @record_tea_leaves = RecordTeaLeafe.looks(params[:search], params[:word])
    end
  end
end
