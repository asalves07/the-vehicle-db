class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  def index
    @vehicles = Vehicle.includes(:manufacturer, :sale)

    render json: @vehicles
  end

  def show
    render json: @vehicle, status: 200
  end

  def update

    if @vehicle.update(vehicle_params)
      render json: @vehicle, status: 200
    else
      render json: { errors: @vehicle.errors }, status: 422
    end
  end

  def create
    @vehicle = Vehicle.new vehicle_params

    if @vehicle.save
      render json: @vehicle, status: 201
    else
      render json: { errors: @vehicle.errors }, status: 422
    end
  end

  def destroy
    @vehicle.destroy
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:car_model, :color, :transmission, :drive_type, :fuel_type, :car_type,
                            :door, :engine, :year, :kilometrage, :plate, :manufacturer_id, :_destroy, sale_attributes: [:id, :sold]]
      )
  end
end
