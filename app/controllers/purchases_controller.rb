class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create, :pay_item]
  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def done
    @item_purchaser = Item.find(params[:item_id])
    @item_purchaser.update(purchaser_id: current_user.id)
  end

  private

  def address_params
    params.permit(:postal, :province_id, :city, :street, :building, :phone, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
