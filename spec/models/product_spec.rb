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
      expect(@product.errors.full_messages).to include("出品画像を入力してください")
    end
    it "nameが空では出品できない" do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("商品名を入力してください")
    end
    it "infoが空では出品できない" do
      @product.info = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("商品の説明を入力してください")
    end
    it "categoryが1では出品できない" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end
    it "sales_statusが1では出品できない" do
      @product.sales_status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end
    it "shipping_fee_statusが1では出品できない" do
      @product.shipping_fee_status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
    end
    it "prefectureが1では出品できない" do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
    end
    it "scheduled_deliveryが1では出品できない" do
      @product.scheduled_delivery_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
    end
    it "priceが空では出品できない" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("販売価格を入力してください")
    end
    it "priceが¥300以下では出品できない" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("販売価格は299より大きい値にしてください")
    end
    it "priceが¥9999999以上では出品できない" do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
    end
    it "priceが半角数字以外では出品できない" do
      @product.price = '３０００'
      @product.valid?
      expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
    end
  end
end
