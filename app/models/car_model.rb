class CarModel < ApplicationRecord
  
  validates_presence_of :manufacturer

  belongs_to :manufacturer
  has_many :car_models
end
