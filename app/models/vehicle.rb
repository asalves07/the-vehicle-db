class Vehicle < ApplicationRecord
  belongs_to :manufacturer
  has_one :sale
end
