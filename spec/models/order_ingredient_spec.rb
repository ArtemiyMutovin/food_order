require 'rails_helper'

RSpec.describe OrderIngredient, type: :model do
  it { is_expected.to belong_to :ingredient }
  it { is_expected.to belong_to :order }
end
