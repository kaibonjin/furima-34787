class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def items_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_till_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
