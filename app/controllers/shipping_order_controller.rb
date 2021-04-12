class ShippingOrderController < ApplicationController
  def index
    @shipping_order = ShippingOrder.new
    @item = Item.find(params[:item_id])
  end
   def create
     binding.pry
     @shipping_order = ShippingOrder.new(order_params)
     if @shipping_order.valid?
       @shipping_order.save
       redirect_to root_path
     else
       render :new
     end
   end
  
   private
   def order_params
     params.require(:shipping_order).permit(:token, :postal_code, :prefecture_id, :city_town, :street, :building, :phone).merge(user_id: current_user.id)
   end
end
