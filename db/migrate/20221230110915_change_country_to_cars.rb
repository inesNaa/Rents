class ChangeCountryToCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :country
    add_column :cars, :car_country, :string
  end
end
