class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all

    render json: @manufacturers
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
