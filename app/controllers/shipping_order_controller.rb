class ShippingOrderController < ApplicationController
  def index
    @shipping_order = ShippingOrder.new
    @item = Item.find(params[:item_id])
  end
  def create
    # １@itemを定義する
    @item = Item.find(params[:item_id])
    @shipping_order = ShippingOrder.new(order_params)
    if @shipping_order.valid?
      pay_item
      @shipping_order.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def order_params
    params.require(:shipping_order).permit(:postal_code, :prefecture_id, :city_town, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  #shipping_order=>{postal_code, }
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段２@itemの中のprice
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end
end
