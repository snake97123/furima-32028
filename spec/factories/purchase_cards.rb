FactoryBot.define do
  factory :purchase_card do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '福岡県' }
    block { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    user_id { 2 }
    item_id { 2 }
  end
end