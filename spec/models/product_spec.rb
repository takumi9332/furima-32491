require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    it "image,name,info,category,sales_status,shipping_fee_status,prefecture,scheduled_delivery,priceが存在すれば出品できる" do
      expect(@product).to be_valid
    end
    it "imageが空では出品できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では出品できない" do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "infoが空では出品できない" do
      @product.info = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Info can't be blank")
    end
    it "categoryが1では出品できない" do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it "sales_statusが1では出品できない" do
      @product.sales_status_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Sales status must be other than 1")
    end
    it "shipping_fee_statusが1では出品できない" do
      @product.shipping_fee_status_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping fee status must be other than 1")
    end
    it "prefectureが1では出品できない" do
      @product.prefecture_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "scheduled_deliveryが1では出品できない" do
      @product.scheduled_delivery_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Scheduled delivery must be other than 1")
    end
    it "priceが空では出品できない" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが¥300以下では出品できない" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than 299")
    end
    it "priceが¥9999999以上では出品できない" do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than 10000000")
    end
    it "priceが半角数字以外では出品できない" do
      @product.price = '３０００'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
  end
end
