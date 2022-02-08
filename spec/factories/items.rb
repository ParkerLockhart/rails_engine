FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence(word_count: 4) }
    unit_price { Faker::Number.number(digits: 4) }
    association :merchant, factory: :merchant
  end
end
