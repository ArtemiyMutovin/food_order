require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_ingredients).dependent(:destroy) }
  it { is_expected.to have_many(:ingredients).through(:order_ingredients) }
end
