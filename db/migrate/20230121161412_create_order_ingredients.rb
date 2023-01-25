class CreateOrderIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :order_ingredients do |t|
      t.references :ingredient, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
