class ShipmentsController < ApplicationController
  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new_with_params(shipment_params)

    if @shipment.valid? == true
       @shipment.do_shipment()
       flash[:success] = "Shipment was successfully created."
       redirect_to root_path()
    else
      flash[:danger] = "Shipment was unsuccessfully created. Please check the information you entered."
      render 'new'
    end
  end

  private
  def shipment_params
    params.require(:shipment).permit(:name, :company, :address, :city, :state, :zip)
  end

end
