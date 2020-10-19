class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :update, :destroy]

  def index
    @manufacturers = Manufacturer.includes(:vehicles)

    render json: @manufacturers
  end

  def show
    render json: @manufacturer, status: 200
  end

  def update
    if @manufacturer.update(manufacturer_params)
      render json: @manufacturer, status: 200
    else
      render json: { errors: @manufacturer.errors }, status: 422
    end
  end

  def create
    @manufacturer = Manufacturer.new manufacturer_params

    if @manufacturer.save
      render json: @manufacturer, status: 201
    else
      render json: { errors: @manufacturer.errors }, status: 422
    end
  end

  def destroy
    @manufacturer.destroy
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name, 
      vehicles_attributes: [:id, :car_model, :color, :transmission, :drive_type, :fuel_type, :car_type,
                            :door, :engine, :year, :kilometrage, :plate, :_destroy, sale_attributes: [:id, :sold]]
      )
  end
end
