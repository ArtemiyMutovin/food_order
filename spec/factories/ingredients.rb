FactoryBot.define do
  sequence :title do |n|
    "title#{n}"
  end

  factory :ingredient do
    title
  end
end
