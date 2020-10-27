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

        validates :name,presence: true
        validates :description,presence: true
        validates :category_id, presence: true
        validates :category_id,numericality:{other_than: 0 }
        validates :condition_id, presence: true
        validates :condition_id,numericality:{other_than: 0 }
        validates :fee_id, presence: true
        validates :fee_id,numericality:{other_than: 0 }
        validates :from_id,presence: true
        validates :from_id,numericality:{other_than: 0 }
        validates :days_id, presence: true
        validates :days_id,numericality:{other_than: 0 }
        validates :price,numericality:{only_integer: true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999},presence: true
        validates :image,presence: true
      end

