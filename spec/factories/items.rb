FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price {300}
    description{Faker::Lorem.sentence}
    fee_id{1}
    from_id{1}
    days_id{1}
    category_id{1}
    condition_id{1}
    association :user


  trait :image do
    after(:build) do |item|
      File.open("#{Rails.root}/public/images/test_image.png") do |f|
        item.images.attach(io: f, filename: "test_image.png", content_type: 'image/png')
        end
      end
    end
  end
end
