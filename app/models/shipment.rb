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

  def initialize

  end

  def initialize_with_shipment_params shipment_params
    initialize
    @name = shipment_params[:name]
    @company = shipment_params[:company]
    @address = shipment_params[:address]
    @city = shipment_params[:city]
    @state = shipment_params[:state]
    @zip = shipment_params[:zip]
  end

  def self.new_with_params shipment_params
    forerunner = allocate
    forerunner.send(:initialize_with_shipment_params, shipment_params)
    forerunner
  end

end
