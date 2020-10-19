class ManufacturerSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :vehicles do
    link(:related) {manufacturer_vehicles_url(object.id)}
  end
end
