class Admin::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Coffee"
      @record_coffees = RecordCoffee.looks(params[:search], params[:word])
    else
      @record_tea_leaves = RecordTeaLeafe.looks(params[:search], params[:word])
    end
  end
end
