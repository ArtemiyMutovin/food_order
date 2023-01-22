require 'rails_helper'

RSpec.describe OrderDish, type: :model do
  it { is_expected.to belong_to :dish }
  it { is_expected.to belong_to :order }
end
