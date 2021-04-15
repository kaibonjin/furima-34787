FactoryBot.define do
  factory :shipping_order do
    postal_code {"100-0000"}
    prefecture_id {3}
    city_town {"藤沢市"}
    street {"久保37"}
    building {}
    phone { "09000000000" }
  end
end
