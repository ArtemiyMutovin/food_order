require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { is_expected.to have_many(:dish_ingredients).dependent(:destroy) }
  it { is_expected.to have_many(:ingredients).through(:dish_ingredients) }

  it { is_expected.to validate_presence_of :name }

  describe 'validate test uniqueness' do
    let!(:dish) { create(:dish) }

    it { is_expected.to validate_uniqueness_of :name }
  end
end
