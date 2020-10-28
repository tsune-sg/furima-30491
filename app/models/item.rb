      class Item < ApplicationRecord

        extend ActiveHash::Associations::ActiveRecordExtensions
        belongs_to_active_hash :from
        belongs_to_active_hash :category
        belongs_to_active_hash :condition
        belongs_to_active_hash :day
        belongs_to_active_hash :fee
        belongs_to :user
        has_one    :purchase
        has_one_attached :image


        with_options presence: true do
        validates :name
        validates :description
        validates :image
        end
        with_options presence: true,numericality:{other_than: 0 } do
        validates :category_id
        validates :condition_id
        validates :fee_id
        validates :from_id
        validates :days_id
        end
        validates :price,numericality:{only_integer: true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999},presence: true
      end

