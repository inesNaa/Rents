class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.text :brand
      t.integer :year
      t.text :model
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
