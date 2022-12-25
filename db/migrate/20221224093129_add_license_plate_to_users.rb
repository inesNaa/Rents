class AddLicensePlateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :license_plate, :text
  end
end
