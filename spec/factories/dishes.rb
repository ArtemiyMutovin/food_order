FactoryBot.define do
  sequence :name do |n|
    "name#{n}"
  end

  factory :dish do
    name
  end
end
