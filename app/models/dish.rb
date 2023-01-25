class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients

  validates :name, presence: true
  validates :name, uniqueness: true
end
