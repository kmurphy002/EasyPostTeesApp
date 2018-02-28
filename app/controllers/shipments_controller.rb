class ShipmentsController < ApplicationController
  def new
    @shipment = Shipment.new
  end

  def create
    render plain: params[:shipment].inspect
    @shipment = Shipment.new(shipment_params)
    redirect_to shipments_path(@shipment)
  end

  def show
    @shipment = Shipment.new(params[:id])
  end

  private
  def shipment_params
    params.require(:shipment).permit(:name, :company, :address, :city, :state, :zip)
  end
end
