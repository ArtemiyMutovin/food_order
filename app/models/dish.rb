class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients

  has_many :order_dishes, dependent: :destroy
  has_many :orders, through: :order_dishes

  validates :name, presence: true
  validates :name, uniqueness: true
end
