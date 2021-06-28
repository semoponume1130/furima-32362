 class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)

    if item.save
      redirect_to item_path(item.id)
    else
      redirect_to edit_item_path
    end
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

  def set_item
    @item = Item.find(params[:id])
  end

end

