FactoryBot.define do
  factory :item do
    association :user
    item { '商品名' }
    description { '商品説明' }
    price { 3000 }
    condition_id { 2 }
    shipping_id { 2 }
    area_id { 2 }
    day_id { 2 }
    category_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
