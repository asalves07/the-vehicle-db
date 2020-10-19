class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all

    render json: @car_models 
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
