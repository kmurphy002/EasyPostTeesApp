class ShipmentsController < ApplicationController
  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new_with_params(shipment_params)
    redirect_to shipment_path(@shipment, params[:id])
  end

  def show
    @shipment = Shipment.find(params[:id])
  end

  private
  def shipment_params
    params.require(:shipment).permit(:name, :company, :address, :city, :state, :zip)
  end

end
