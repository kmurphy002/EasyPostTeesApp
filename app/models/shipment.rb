class Shipment
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end

  def name
  end

  def company
  end

  def address
  end

  def city
  end

  def state
  end

  def zip
  end
end
