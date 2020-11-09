class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :purchase_id, :postal, :province_id, :city, :street, :building, :phone

  with_options presence: true do
    validates :token
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :phone, length: { maximum: 11 }
  end
  validates :province_id, numericality: { other_than: 0 }, presence: true
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, province_id: province_id, city: city, street: street, building: building, phone: phone, purchase_id: purchase.id)
  end
end
