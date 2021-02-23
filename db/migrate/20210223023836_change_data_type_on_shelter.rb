class ChangeDataTypeOnShelter < ActiveRecord::Migration[6.1]
  def change
    change_column :shelters, :hours_of_operation, :string
  end
end
