class Purchaser
  include ActiveModel::Model
  after_accessor :user, :product, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase
  
  with_options presence: true do
    validates :user
    validates :product
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を使用してください"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
    validates :purchase
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Purchases.create(uesr_id: uesr_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, purchase_id: purchase_id)
  end
end