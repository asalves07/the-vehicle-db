class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  def show
    unless params[:manufacturer_id]
      render json: @vehicle, include: [:manufacturer, :sale]
    else 
      render json: @vehicles
    end

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

    if params[:manufacturer_id]
      @vehicles = Vehicle.where(manufacturer_id: params[:manufacturer_id])
    else
      @vehicle = Vehicle.find(params[:id])
    end

  end

  def vehicle_params
    # params.require(:vehicle).permit(:car_model, :color, :transmission, :drive_type, :fuel_type, :car_type, 
    #                                   :door, :engine, :year, :kilometrage, :plate, :manufacturer_id, 
    #                                   :_destroy, sale_attributes: [:id, :sold])
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
