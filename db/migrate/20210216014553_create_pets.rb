class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :type
      t.boolean :adopted
      t.references :shelter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
