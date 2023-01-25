class OrdersController < ApplicationController
  def index
    @orders = Order.includes(%i[ingredients order_ingredients]).all
    @ingredients = Ingredient.all
  end

  def dishes_count
    dishes =
      Dish.joins(:dish_ingredients)
          .joins('inner join order_ingredients on order_ingredients.ingredient_id = dish_ingredients.ingredient_id')
          .group('dishes.name').order('COUNT(dishes.id) DESC').count('dishes.id')
    render json: dishes.map { |dish| { name: dish.first, count: dish.last } }.to_json
  end

  def create
    @order = Order.create
    @order.ingredients << Ingredient.where.not(id: params[:ingredient_id].reject(&:blank?))

    redirect_to orders_path
  end
end
