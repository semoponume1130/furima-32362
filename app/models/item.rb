class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :shipping
  belongs_to :day

  with_options presence: true do
  validates :item
  validates :description 
  validates :image
  end

  validates_inclusion_of :price, in:300..9999999, message: 'は300〜9999999までの範囲で入力してください'


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' } do
    validates :price
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id 
  validates :area_id 
  validates :shipping_id 
  validates :day_id
end

end
