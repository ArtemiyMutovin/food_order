class Order < ApplicationRecord
  has_many :order_dishes, dependent: :destroy
  has_many :dishes, through: :order_dishes
end
