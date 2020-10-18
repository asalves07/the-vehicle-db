class Vehicle < ApplicationRecord
  validates_presence_of :car_model
  validates_presence_of :sale

  belongs_to :car_model
  has_one :sale

  accepts_nested_attributes_for :sale
end
