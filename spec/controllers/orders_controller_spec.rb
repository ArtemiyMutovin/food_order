require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:ingredient) { create(:ingredient) }
  let!(:ingredient_second) { create(:ingredient) }
  let!(:ingredient_third) { create(:ingredient) }
  let!(:dish) { create(:dish, ingredients: [ingredient, ingredient_second]) }
  let!(:dish_second) { create(:dish, ingredients: [ingredient_third]) }

  describe 'GET #index' do
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #dishes_count' do
    let!(:order) { create(:order, ingredients: [ingredient, ingredient_second]) }
    let!(:order_second) { create(:order, ingredients: [ingredient_third]) }
    let(:expected_array) do
      [{ 'name' => dish.name, 'count' => 2 }, { 'name' => dish_second.name, 'count' => 1 }]
    end

    it 'returns expected JSON respond' do
      get :dishes_count
      expect(JSON.parse(response.body)).to eq(expected_array)
    end
  end

  describe 'GET #create' do
    it 'create order without selected ingredients' do
      expect { post :create, params: { ingredient_id: [ingredient_third.id] } }
        .to change(Order, :count).by(1)
      expect(Order.last.ingredients.first).to eq(ingredient)
      expect(response).to redirect_to orders_path
    end
  end
end
