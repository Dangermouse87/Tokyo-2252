class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = policy_scope(Restaurant)
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    authorize @restaurant # checks if the user is authorized to see the restaurant
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    authorize @restaurant # checks if the user is authorized to create a restaurant
  end

  # GET /restaurants/1/edit
  def edit
    authorize @restaurant # checks if the user is authorized to edit the restaurant
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user # assigning the current logged in user to the restaurant
    authorize @restaurant # checks if the user is authorized to create a restaurant

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @restaurant.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    authorize @restaurant # checks if the user is authorized to update the restaurant
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: "Restaurant was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @restaurant.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    authorize @restaurant # checks if the user is authorized to destroy the restaurant
    @restaurant.destroy!  

    respond_to do |format|
      format.html { redirect_to restaurants_path, notice: "Restaurant was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name)
    end
end
