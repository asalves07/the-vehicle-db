class Sale < ApplicationRecord
  validates_presence_of :vehicle
  
  belongs_to :vehicle
end
