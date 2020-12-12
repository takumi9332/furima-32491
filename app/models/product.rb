class Product < ApplicationRecord
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user

  with_options presence: true do
  validates :name
  validates :info
  validates :price
  validates :user
  validates :image
  end
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  end
  validates :price, numericality: { greater_than: 299 , less_than: 10000000}
end
