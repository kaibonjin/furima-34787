class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_till_ship
  
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :item_name, :description, :price, :image
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_till_ship_id
  end
  validates_inclusion_of :price, in: 300..9999999, message: "must be between 300~9999999"
  validates :price, numericality: {message: "must be a number"}
end
