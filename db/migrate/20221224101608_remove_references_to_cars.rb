class RemoveReferencesToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :car_type_id
  end
end
