require 'rails_helper'

RSpec.describe ShippingOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shipping_order = FactoryBot.build(:shipping_order, user_id: user.id, item_id: item.id)
    sleep(1) #ゆっくり読ませるメソッド
  end

  describe "商品購入" do
    context '商品購入できるとき' do
      it '配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること' do
        expect(@shipping_order).to be_valid
      end
    end
    context '商品購入できない時' do
      it 'postal_codeが空では購入できない' do
        @shipping_order.postal_code = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal codeはハイフンがなければ購入できない' do
        @shipping_order.postal_code = '0000000'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では購入できない' do
        @shipping_order.prefecture_id = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Prefecture must be selected")
      end
      it 'city_townが空では購入できない' do
        @shipping_order.city_town = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("City town can't be blank")
      end
      it 'streetが空では購入できない' do
        @shipping_order.street = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空では購入できない' do
        @shipping_order.phone = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneがハイフンあると購入できない' do
        @shipping_order.phone = '090-9873-9388'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end

    #bundle exec rspec spec/models/shipping_order_spec.rb
