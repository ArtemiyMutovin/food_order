class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :dishes, :name, unique: true
  end
end
