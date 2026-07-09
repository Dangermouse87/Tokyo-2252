class DinosaursController < ApplicationController
  before_action :set_park, only: [ :new, :create ]

  def new
    @park = Park.find(params[:park_id])
    @dinosaur = Dinosaur.new
  end

  def create
    @dinosaur = Dinosaur.new(dinosaur_params)
    @dinosaur.park = @park
    if @dinosaur.save
      redirect_to park_path(@park)
    else
      render :new, status: 422
    end
  end

  def destroy
    @dinosaur = Dinosaur.find(params[:id])
    @dinosaur.destroy
    redirect_to park_path(@dinosaur.park), status: :see_other
  end

  private

  def set_park
    @park = Park.find(params[:park_id])
  end

  def dinosaur_params
    params.expect(dinosaur: [:name, :image_url])
  end
end
