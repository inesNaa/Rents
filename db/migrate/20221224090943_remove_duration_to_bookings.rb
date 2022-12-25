class RemoveDurationToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :duration
  end
end
