require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'クレジット情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postalが空だと保存できないこと' do
      @purchase_address.postal = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
    end
    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end
    it 'provinceを選択していないと保存できないこと' do
      @purchase_address.province_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Province must be other than 0")
    end
    it 'cityは空では保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'streetは空では保存できないこと' do
      @purchase_address.street = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @purchase_address.building = nil
      expect(@purchase_address).to be_valid
    end
    it 'phoneは空では保存できないこと' do
      @purchase_address.phone = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneは11桁以内でなければ保存できないこと' do
      @purchase_address.phone = 123456789012
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end
  end
end
