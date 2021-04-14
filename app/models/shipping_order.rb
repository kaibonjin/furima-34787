class ShippingOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_town, :street, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_town, :street, :building, :user_id, :item_id, :token
    validates :phone, format: { with:/\A\d{11}\z/}
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)#モデル名.create（カラム名: 保存したい値）
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city_town: city_town, street: street, building: building, phone: phone, order_id: order.id)
  end
end
#確認手順
#Orderテーブルに保存するカラムを確認
#.create（カラム名: 保存したい値）を参考に１１行目を修正する
#
#