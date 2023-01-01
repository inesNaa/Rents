class AdWizardCompleteToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :wizard_complete, :boolean, null: false, default: false
  end
end
