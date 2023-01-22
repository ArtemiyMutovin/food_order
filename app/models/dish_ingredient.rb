class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  validates :dish_id, uniqueness: { scope: :ingredient_id, case_sensitive: false }
end
