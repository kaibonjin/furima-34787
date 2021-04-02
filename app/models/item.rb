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
  validates :price, presence: true
end
