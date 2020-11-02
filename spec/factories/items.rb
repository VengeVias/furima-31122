FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    description {Faker::String.random}
    price {Faker::Number.between(from: 300, to: 9999999)}
    image {"image"}
    category_id {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    days_to_ship_id {Faker::Number.between(from: 2, to: 4)}
  end
end
