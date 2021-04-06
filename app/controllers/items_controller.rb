class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :findparams, only: [:show, :destroy]

  def index
    @items = Item.order(created_at: :desc)
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
  
  def show
  end

  def destroy
    redirect_to action: :index unless current_user.id == @item.user_id
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def items_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :days_till_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  def findparams
    @item = Item.find(params[:id])
  end
end
