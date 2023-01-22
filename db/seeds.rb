# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
config = YAML.load_file('config/menu.yml')

config['dishes'].each do |dish|
  ActiveRecord::Base.transaction do
    dish_id = Dish.find_or_create_by!(name: dish['name']).id
    dish['ingredients'].each do |ingredient|
      ingredient_id = Ingredient.find_or_create_by!(title: ingredient).id
      DishIngredient.create!(dish_id: dish_id, ingredient_id: ingredient_id)
    end
  end
end
