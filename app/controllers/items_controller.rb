class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    category = Category.data.detect { |o| o[:id] == @item.category_id }
    @categoryName = category[:name]
    condition = Condition.data.detect { |o| o[:id] == @item.condition_id }
    @conditionName = condition[:name]
    days = Day.data.detect { |o| o[:id] == @item.days_id }
    @daysName = days[:name]
    from = From.data.detect { |o| o[:id] == @item.from_id }
    @fromName = from[:name]
    fee = Fee.data.detect { |o| o[:id] == @item.fee_id }
    @feeName = fee[:name]
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

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :fee_id, :from_id, :days_id, :name, :description, :price).merge(user_id: current_user.id)
  end
end
