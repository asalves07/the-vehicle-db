class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all

    render json: @vehicles 
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end
end
