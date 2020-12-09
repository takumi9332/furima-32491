require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'do
    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "同じemailがある場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がないと登録できない" do
      @user.email = 'aaabbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合ではないと登録できない" do
      @user.password = 'abcdef'
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが同じでないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "654321"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameは全角(漢字、ひらがな、カタカナ)ではないと登録できない" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameは全角(漢字、ひらがな、カタカナ)ではないと登録できない" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaは全角(カタカナ)ではないと登録できない" do
      @user.last_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaは全角(カタカナ)ではないと登録できない" do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
