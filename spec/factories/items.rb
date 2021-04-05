FactoryBot.define do
  factory :item do
    association :user
    item_name {'sample'}
    description {'sample'}
    category_id {4}
    condition_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    days_till_ship_id {2}
    price {4000}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end