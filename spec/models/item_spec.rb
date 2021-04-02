require 'rails_helper'
  before do
    @item = FactoryBot.build(:item)
  end

RSpec.describe Item, type: :model do
  context '商品出品できるとき' do
    it 'user, item_name, description, category_id, condition_id, shipping_cost_id, prefecture_id, days_till_ship_id, priceが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できないとき' do
    it 'imageが空だと登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'item_nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'category_idが空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'condition_idが空だと登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'shipping_cost_idが空だと登録できない' do
      @item.shipping_cost = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'prefecture_idが空だと登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'days_till_ship_idが空だと登録できない' do
      @item.days_till_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'priceが空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'priceは¥300~¥9,999,999の間でなければ登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
    it 'priceは半角数字でなければ登録できない' do
      @item.price = '６６'
      @item.valid?
      expect(@item.errors.full_messages).to include("jjj")
    end
  end
end

#bundle exec rspec spec/models/item_spec.rb
