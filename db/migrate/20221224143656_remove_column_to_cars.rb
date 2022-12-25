class RemoveColumnToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :car_insurance 
  end
end
