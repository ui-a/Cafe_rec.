class Public::FavoritesController < ApplicationController

  def index
    @user = current_user
    coffee_favorites = Favorite.where(user_id: @user.id).pluck(:record_coffee_id)
    tea_favorites = Favorite.where(user_id: @user.id).pluck(:record_tea_leafe_id)
    @coffee_favorite = RecordCoffee.find(coffee_favorites)
    #@tea_favorite = RecordTeaLeafe.find(tea_favorites)
  end

  def create
    if params[:record_coffee_id].present?
      @record_coffee = RecordCoffee.find(params[:record_coffee_id])
      favorite = current_user.favorites.new(record_coffee_id: @record_coffee.id)
      favorite.save
      #redirect_to record_coffee_path(record_coffee)
    elsif params[:record_tea_leafe_id].present?
      record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      favorite = current_user.favorites.new(record_tea_leafe_id: record_tea_leafe.id)
      favorite.save
      #redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end

  def destroy
    if params[:record_coffee_id].present?
      @record_coffee = RecordCoffee.find(params[:record_coffee_id])
      favorite = current_user.favorites.find_by(record_coffee_id: @record_coffee.id)
      favorite.destroy
      #redirect_to record_coffee_path(record_coffee)
    elsif params[:record_tea_leafe_id].present?
      @record_tea_leafe = RecordTeaLeafe.find(params[:record_tea_leafe_id])
      favorite = current_user.favorites.find_by(record_tea_leafe_id: @record_tea_leafe.id)
      favorite.destroy
      #redirect_to record_tea_leafe_path(record_tea_leafe)
    else
      render :show
    end
  end


end
