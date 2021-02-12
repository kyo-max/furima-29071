FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { 'サマーガール' }
    phone_number { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { '1' }
    item_id { '1' }
  end
end
