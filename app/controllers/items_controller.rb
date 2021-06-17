 class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :item, :description, :price, :condition_id, :shipping_id, :area_id, :scheduled_delivery_id, :category_id ).merge(user_id: current_user.id)
  end
end
