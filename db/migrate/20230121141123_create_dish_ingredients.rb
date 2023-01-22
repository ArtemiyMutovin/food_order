class CreateDishIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_ingredients do |t|

      t.references :dish, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
    add_index "dish_ingredients", %w[dish_id ingredient_id], unique: true
  end
end
