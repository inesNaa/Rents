class ChangeColumnToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :car_type
    add_column :cars, :type, :string
  end
end
