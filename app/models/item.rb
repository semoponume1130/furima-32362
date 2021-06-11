class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :area
  belongs_to :shipping
  belongs_to :day

  validates :item, :description, presence: true
  validates :image, presence: true
  validates_inclusion_of :price, in:300..9999999, message: 'は300〜9999999までの範囲で入力してください'


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :shipping_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end
