class ChangeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :phone_number
    add_column :users, :phone_number, :string
  end
end
