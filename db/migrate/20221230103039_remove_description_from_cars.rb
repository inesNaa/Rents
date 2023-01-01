class RemoveDescriptionFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :description
  end
end
