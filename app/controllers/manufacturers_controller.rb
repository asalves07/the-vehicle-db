class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :update, :destroy]

  def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    @manufacturers = Manufacturer.includes(:vehicles).page(page_number).per(per_page)

    render json: @manufacturers
  end

  def show
    render json: @manufacturer
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
    if params[:vehicle_id]
      @manufacturer = Vehicle.find(params[:vehicle_id]).manufacturer
    else
      @manufacturer = Manufacturer.find(params[:id])
    end
  end

  def manufacturer_params
    # params.require(:manufacturer).permit(:name, 
    #   vehicles_attributes: [:id, :car_model, :color, :transmission, :drive_type, :fuel_type, :car_type,
    #                         :door, :engine, :year, :kilometrage, :plate, :_destroy, sale_attributes: [:id, :sold]]
    #   )
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
