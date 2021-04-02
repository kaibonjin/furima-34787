FactoryBot.define do
  factory :item do
    item_name {Faker::Name.initials(number: 2)}
    description {Faker::Name.initials(number: 2)}
    category_id {4}
    condition_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    days_till_ship_id {2}
    price {4000}
    image {Faker::Lorem.sentence}
    end
  end
end
