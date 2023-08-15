class Public::FavoritesController < ApplicationController
  
  def index
  end
  
  def create
    if record_coffee = RecordCoffee.find(params[:record_coffee_id])
      favorite = current_user.favorites.new(record_coffee_id: record_coffee.id)
      favorite.save
      #redirect_to record_coffee_path(record_coffee)
    elsif record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      favorite = current_user.favorites.new(record_tea_leafe_id: record_tea_leafe.id)
      favorite.save
      #redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end
  
  def destroy
    if record_coffee = RecordCoffee.find(params[:record_coffee_id])
      favorite = current_user.favorites.find_by(record_coffee_id: record_coffee.id)
      favorite.destroy
      #redirect_to record_coffee_path(record_coffee)
    elsif record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      favorite = current_user.favorites.find_by(record_tea_leafe_id: record_tea_leafe.id)
      favorite.destroy
      #redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end
  
  
end
