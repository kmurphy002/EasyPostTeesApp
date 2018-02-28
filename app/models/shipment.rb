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

  def fromAddress
    @fromAddress = ""
  end

  def toAddress
    @toAddress = ""
  end

  def parcel
    @parcel = ""
  end

  def shipment
    @shipment ""
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

  def do_shipment
    require 'easypost'
    EasyPost.api_key = "<YOUR_TEST/3RIbYwbdP4FpQ9Kqcg83xw>"

    fromAddress = EasyPost::Address.create(
      company: 'EasyPost',
      street1: '417 Montgomery Street',
      street2: '5th Floor',
      city: 'San Francisco',
      state: 'CA',
      zip: '94104',
      phone: '415-528-7555'
    )
    toAddress = EasyPost::Address.create(
      name: @name,
      company: @company,
      street1: @address,
      city: @city,
      state: @state,
      zip: @zip
    )
    parcel = EasyPost::Parcel.create(
      predefined_package: 'FlatRateEnvelope',
      weight: 10
    )
    shipment = EasyPost::Shipment.create(
      to_address: toAddress,
      from_address: fromAddress,
      parcel: parcel
    )
    shipment.buy(
      rate: shipment.lowest_rate(carriers = ['USPS'], services = ['First'])
    )
  end
end
