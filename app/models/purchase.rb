class Purchase < ApplicationRecord
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
end
