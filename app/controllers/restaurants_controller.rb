class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_strong_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id].to_i)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id].to_i)
    if @restaurant.destroy
      redirect_to tasks_path
    else
      render :index
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id].to_i)
    if @restaurant.update(restaurants_strong_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurants_strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
