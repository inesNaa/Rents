class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :city, presence: true
  validates :fuel, presence: true
  validates :price_per_day, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :mileage, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
