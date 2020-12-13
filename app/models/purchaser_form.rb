class PurchaserForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を使用してください"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end