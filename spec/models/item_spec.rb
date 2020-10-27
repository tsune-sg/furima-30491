require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '#create' do
    
  context "出品がうまくいくとき" do
  it "全ての項目の入力が存在すれば登録できること" do
    expect(@item).to be_valid
  end
end
  context '出品がうまくいかない時' do
  it '画像がないと登録できない'do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  it "nameが空では登録できないこと" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "descriptionが空では登録できないこと" do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end
  it "categoryが空では登録できないこと" do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "conditionが空では登録できないこと" do
    @item.condition_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end
  it "feeが空では登録できないこと" do
    @item.fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Fee can't be blank")
  end
  it "fromが空では登録できないこと" do
    @item.from_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("From can't be blank")
  end
  it "daysが空では登録できないこと" do
    @item.days_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Days can't be blank")
  end
  it "priceが空,または¥300~¥9,999,999の範囲外では登録できないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "priceが半角数字でしか登録できないこと" do
    @item.price = "１２３４５６"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

end
end
end
