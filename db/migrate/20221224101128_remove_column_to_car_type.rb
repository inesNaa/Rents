class RemoveColumnToCarType < ActiveRecord::Migration[7.0]
  def change
    remove_column :car_types, :sedan_car
    remove_column :car_types, :urban_car
    remove_column :car_types, :utility_vehicle
    remove_column :car_types, :non_licensed_car

  end
end
