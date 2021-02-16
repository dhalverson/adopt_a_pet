class RenameTypeToBreed < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :type, :breed
  end
end
