class Item < ApplicationRecord
  
  belongs_to   :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  has_one_attached :image

  validates  :price, presence: true, format: { with: /\A^[0-9]+$\z/,}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  with_options presence: true do
    validates   :name  
    validates   :description
    validates   :image
  end
  with_options numericality: { other_than: 1 } do
    validates   :category_id
    validates   :status_id
    validates   :cost_id
    validates   :prefecture_id
    validates   :day_id
    
  end
end


  