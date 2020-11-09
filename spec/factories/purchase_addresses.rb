FactoryBot.define do
  factory :purchase_address do
    token { 'aaa' }
    postal { '123-4567' }
    province_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { 99_999_999_999 }
  end
end
