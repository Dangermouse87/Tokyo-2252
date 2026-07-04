class RestaurantsController < ApplicationController
  # callback to automatically before certain actions
  before_action :set_restaurant, only:[:show, :edit, :update, :destroy]

  # read all
  def index
    @restaurants = Restaurant.all
  end

  # read one
  def show
    # line below now in set_restaurant callback to prevent repetition
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    # instantiate new restaurant
    @restaurant = Restaurant.new
  end

  def create
    # add params to the new restaurant
    @restaurant = Restaurant.new(restaurant_params)
    # save
    @restaurant.save
    # redirect
    redirect_to restaurant_path(@restaurant)
  end


  # same as above but with if/else statement
  # def create
  #   # add params to the new restaurant
  #   @restaurant = Restaurant.new(restaurant_params)
  #   # if the restaurant is saved, redirect to the restaurant show page
  #   if @restaurant.save
  #     redirect_to restaurant_path(@restaurant)
  #   # if the restaurant is not saved, render the new page again
  #   else
  #     render :new
  #   end
  # end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params) # pass through allowed params
    redirect_to restaurant_path(@restaurant)
  end

  # same as above but with if/else statement
  # def update
  #   # add params to the restaurant
  #   @restaurant.update(restaurant_params)
  #   # if the restaurant is saved, redirect to the restaurant show page
  #   if @restaurant.save
  #     redirect_to restaurant_path(@restaurant)
  #   # if the restaurant is not saved, render the edit page again
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  # set the restaurant as a callback to prevent repetition
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  
  # set whitelisted params
  def restaurant_params
    # list the params that would like to allow
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
