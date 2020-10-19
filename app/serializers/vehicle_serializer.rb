class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :car_model, :color, :transmission, :drive_type, :fuel_type, :car_type, :door, :engine, :year, :kilometrage, :plate, :manufacturer_id

  belongs_to :manufacturer do
    link(:related) {vehicle_manufacturer_url(object.id)}
  end

  has_one :sale do
    link(:related) {vehicle_sale_url(object.id)}
  end

end
