class CreateCarTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :car_types do |t|
      t.string :utility_vehicle
      t.string :urban_car
      t.string :sedan_car
      t.string :non_licensed_car

      t.timestamps
    end
  end
end
