class Ingredient < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients

  has_many :order_ingredients, dependent: :destroy
  has_many :orders, through: :order_ingredients

  validates :title, presence: true
  validates :title, uniqueness: true
end
