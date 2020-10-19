class Manufacturer < ApplicationRecord
  has_many :vehicles

  accepts_nested_attributes_for :vehicles, allow_destroy: true

  def as_json(option={})
    super(root: true, include: {vehicles: {include: :sale}})
  end

  paginates_per 10
end
