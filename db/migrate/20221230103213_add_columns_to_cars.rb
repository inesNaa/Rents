class AddColumnsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :plate_number, :text
    add_column :cars, :country, :string
    add_column :cars, :gearbox, :string
    add_column :cars, :doors, :integer
    add_column :cars, :seats, :integer
    add_column :cars, :options, :text 
  end
end
