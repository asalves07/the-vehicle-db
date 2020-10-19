class SaleSerializer < ActiveModel::Serializer
  attributes :id, :sold

  belongs_to :vehicle
end
