class AddReferencesToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :car_type, foreign_key: true
  end
end
