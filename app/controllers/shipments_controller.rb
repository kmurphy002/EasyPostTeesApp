class ShipmentsController < ApplicationController
  def new
    @shipment = Shipment.new
  end

  def create
    render plain: params[:shipment].inspect
  end
end
