require 'rails_helper'
  

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品できるとき' do
    it 'image, item_name, description, category_id, condition_id, shipping_cost_id, prefecture_id, days_till_ship_id, priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空だと登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが空だと登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'condition_idが空だと登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'shipping_cost_idが空だと登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it 'shipping_cost_idが空だと登録できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it 'prefecture_idが空だと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが空だと登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'days_till_ship_idが空だと登録できない' do
      @item.days_till_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days till ship can't be blank")
    end
    it 'days_till_ship_idが空だと登録できない' do
      @item.days_till_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days till ship must be other than 1")
    end
    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceは¥300より小さくては登録できない' do
      @item.price = 29
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300~9999999")
    end
    it 'priceは半角数字でなければ登録できない' do
      @item.price = '６６'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number")
    end
    it 'priceは半角英語だけでは登録できない' do
      @item.price = 'aa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number")
    end
    it 'priceは半角英数混合では登録できない' do
      @item.price = '9a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number")
    end
    it 'priceは¥9,999,999より大きくては登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300~9999999")
    end
  end
end

#bundle exec rspec spec/models/item_spec.rb
