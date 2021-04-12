class ShippingOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_town, :street, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_town, :street, :building, :phone, :user_id, :item_id, :token
  end
  def save
    order = Order.create(:user_id, :item_id, :token)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, street: street, building: building, phone: phone)
  end
end