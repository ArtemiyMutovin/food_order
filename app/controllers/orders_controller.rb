class OrdersController < ApplicationController
  def index
    @orders = Order.includes(%i[dishes order_dishes]).all
    @ingredients = Ingredient.all
  end

  def dishes_count
    dishes = Dish.joins(:order_dishes).group('dishes.name')
                 .order('COUNT(order_dishes.dish_id) DESC').count('order_dishes.dish_id')
    render json: dishes.map { |dish| { name: dish.first, count: dish.last } }.to_json
  end

  def create
    excluding_dishes_ids = DishIngredient
                           .where(ingredient_id: params[:ingredient_id].reject(&:blank?)).pluck(:dish_id)
    dishes = Dish.where.not(id: excluding_dishes_ids)
    @order = Order.create
    @order.dishes << dishes

    redirect_to orders_path
  end
end
