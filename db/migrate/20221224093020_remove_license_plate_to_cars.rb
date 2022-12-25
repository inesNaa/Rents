class RemoveLicensePlateToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :license_plate
  end
end
