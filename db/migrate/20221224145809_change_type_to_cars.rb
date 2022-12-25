class ChangeTypeToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :type
    add_column :cars, :type_of_vehicle, :string
  end
end
