class ChangeOpenOnShelter < ActiveRecord::Migration[6.1]
  def change
    rename_column :shelters, :open, :hours_of_operation
  end
end
