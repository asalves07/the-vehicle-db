class SalesController < ApplicationController
  before_action :set_sale

  def show
    render json: @sale
  end


  private
  def set_sale
    @sale = Vehicle.find(params[:vehicle_id]).sale
  end

end
