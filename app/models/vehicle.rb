class Vehicle < ApplicationRecord
  validates_presence_of :manufacturer
  validates_presence_of :sale

  belongs_to :manufacturer
  has_one :sale

  accepts_nested_attributes_for :sale, allow_destroy: true

  def as_json(option={})
    super(root: true, include: :sale)
  end

  paginates_per 10
end
