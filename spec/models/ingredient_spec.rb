require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to have_many(:dish_ingredients).dependent(:destroy) }
  it { is_expected.to have_many(:dishes).through(:dish_ingredients) }

  it { is_expected.to have_many(:order_ingredients).dependent(:destroy) }
  it { is_expected.to have_many(:orders).through(:order_ingredients) }

  it { is_expected.to validate_presence_of :title }

  describe 'validate test uniqueness' do
    let!(:ingredient) { create(:ingredient) }

    it { is_expected.to validate_uniqueness_of :title }
  end
end
