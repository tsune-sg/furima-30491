require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@purchase).to be_valid
  end

  it "priceが空では保存ができないこと" do
    @purchase.price = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
end
