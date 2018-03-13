class ShipmentsController < ApplicationController
  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new_with_params(shipment_params)
    @isNameValid = @shipment.valid?

    if @isNameValid == true
       @shipment.do_shipment()
    end






    redirect_to root_path()
  end

  private
  def shipment_params
    params.require(:shipment).permit(:name, :company, :address, :city, :state, :zip)
  end

end
