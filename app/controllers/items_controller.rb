class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    if current_user == @item.user && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :fee_id, :from_id, :day_id, :name, :description, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
