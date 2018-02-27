class Shipment
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end

  def title
  end
end
