class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_till_ship
  
  belongs_to :user
  has_one_attached :image
  
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :days_till_ship_id, presence: true, numericality: { other_than: 1 }
  validates_inclusion_of :price, in: 300..9999999, message: "must be between 300~9999999"
  validates :price, format: {with: /\A[0-9]+\z/}
  validates :price, presence: true
  validates :image, presence: true
end

#エラーメッセージをちゃんといれたい
