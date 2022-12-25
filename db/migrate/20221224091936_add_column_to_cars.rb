class AddColumnToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :mileage, :integer
    add_column :cars, :fuel, :string
    add_column :cars, :license_plate, :text
    add_column :cars, :car_insurance, :text
  end
end
