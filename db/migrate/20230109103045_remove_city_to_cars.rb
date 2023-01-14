class RemoveCityToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :city
  end
end
