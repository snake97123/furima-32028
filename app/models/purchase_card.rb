class PurchaseCard
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates  :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates  :city
    validates  :block
    validates  :prefecture_id, numericality: { other_than: 1 }
    validates  :phone_number, format: { with: /\A^(0{1}\d{9,10})$\z/ }
    validates  :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, city: city, block: block, prefecture_id: prefecture_id, phone_number: phone_number, purchase_id: purchase.id)
  end
end
