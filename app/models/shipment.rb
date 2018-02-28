class Shipment
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end

  def name
    @name = ""
  end

  def company
    @company = ""
  end

  def address
    @address = ""
  end

  def city
    @city = ""
  end

  def state
    @state = ""
  end

  def zip
    @zip = ""
  end

  def initialize()
  end

  def initialize(shipment_params = nil)
    @name = shipment_params[:name]
    @company = shipment_params[:company]
    @address = shipment_params[:address]
    @city = shipment_params[:city]
    @state = shipment_params[:state]
    @zip = shipment_params[:zip]
  end
end
