class DropTableCarType < ActiveRecord::Migration[7.0]
  def change
    drop_table :car_types
  end
end
