require 'rails_helper'

RSpec.describe DishIngredient, type: :model do
  it { is_expected.to belong_to :dish }
  it { is_expected.to belong_to :ingredient }

  describe 'validate test uniqueness' do
    let!(:dish_ingredient) { create(:dish_ingredient) }

    it { is_expected.to validate_uniqueness_of(:dish_id).scoped_to(:ingredient_id).case_insensitive }
  end
end
