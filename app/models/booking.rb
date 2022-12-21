class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_date, presence: true
  validates :duration, presence: true 


end
