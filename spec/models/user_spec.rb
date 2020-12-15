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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it "同じemailがある場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "emailに@がないと登録できない" do
      @user.email = 'aaabbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordが半角英数字混合ではないと登録できない" do
      @user.password = 'abcdef'
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英字と数字の両方を含めて設定してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordとpassword_confirmationが同じでないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "654321"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end
    it "last_nameは全角(漢字、ひらがな、カタカナ)ではないと登録できない" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は全角文字を使用してください")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it "first_nameは全角(漢字、ひらがな、カタカナ)ではないと登録できない" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角文字を使用してください")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のフリガナを入力してください")
    end
    it "last_name_kanaは全角(カタカナ)ではないと登録できない" do
      @user.last_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のフリガナは全角カタカナを使用してください")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
    end
    it "first_name_kanaは全角(カタカナ)ではないと登録できない" do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナは全角カタカナを使用してください")
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
