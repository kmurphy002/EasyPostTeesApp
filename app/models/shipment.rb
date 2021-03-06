require 'easypost'
class Shipment
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Model
  include ActiveModel::Validations

  def persisted?
    false
  end

  attr_accessor :name, :company, :address, :city, :state, :zip
  attr_reader   :errors

  VALID_ADDRESS_REGEX = /\d{1,5}\s(\b\w*\b\s){1,2}\w*\./
  VALID_ZIP_REGEX = /\d{5}/
  VALID_STATE_REGEX = /[A-Za-z]{2}/

  validates :name, presence: true
  validates :company, presence: true
  validates :address, presence: true, format: { with: VALID_ADDRESS_REGEX } #example of valid address 111 Marsh st.
  validates :city, presence: true
  validates :state, presence: true, length: { minimum: 2, maximum: 2 }, format: { with: VALID_STATE_REGEX }
  validates :zip, presence: true, length: { minimum: 5, maximum: 5 }, format: { with: VALID_ZIP_REGEX }

  def initialize

  end

  def initialize_with_shipment_params shipment_params
    initialize
    @errors = ActiveModel::Errors.new(self)
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
    EasyPost.api_key = "3RIbYwbdP4FpQ9Kqcg83xw"

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
    shipment.buy(rate: shipment.rates.first)
  end
end
