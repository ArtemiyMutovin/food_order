require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_dishes).dependent(:destroy) }
  it { is_expected.to have_many(:dishes).through(:order_dishes) }
end
