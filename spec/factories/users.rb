FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    lastname { '亜' }
    firstname { '亜' }
    firstname_furigana { 'カタカナ' }
    lastname_furigana { 'カタカナ' }
    birth { 20_201_201 }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
