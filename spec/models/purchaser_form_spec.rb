require 'rails_helper'

RSpec.describe PurchaserForm, type: :model do
  before do
    @purchaser_form = FactoryBot.build(:purchaser_form)
  end

  describe '商品購入' do
    it "全ての値が正しく入力されていれば購入できる" do
      expect(@purchaser_form).to be_valid
    end
    it "postal_codeが空では購入できない" do
      @purchaser_form.postal_code = nil
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeにはハイフンがないと購入できない" do
      @purchaser_form.postal_code = '1234567'
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Postal code ハイフン(-)を使用してください")
    end
    it "prefecture_idが1では購入できない" do
      @purchaser_form.prefecture_id = 1
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "cityが空では購入できない" do
      @purchaser_form.city = nil
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空では購入できない" do
      @purchaser_form.address = nil
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Address can't be blank")
    end
    it "buildingは空でも購入できる" do
      @purchaser_form.building = nil
      expect(@purchaser_form).to be_valid
    end
    it "phone_numberが空では購入できない" do
      @purchaser_form.phone_number = nil
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberにはハイフンがあると購入できない" do
      @purchaser_form.phone_number = '090-1234-5678'
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが12桁以上では購入できない" do
      @purchaser_form.phone_number = '123456789012'
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では購入できない" do
      @purchaser_form.token = nil
      @purchaser_form.valid?
      expect(@purchaser_form.errors.full_messages).to include("Token can't be blank")
    end
  end
end
