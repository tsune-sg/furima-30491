class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
          validates :password, format: { with: VALID_PASSWORD_REGEX }
          validates :nickname,presence: true
          validates :birth, presence: true
          validates :firstname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
          validates :lastname, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
          validates :firstname_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
          validates :lastname_furigana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }

          has_many :items
          has_many :purchases
end
