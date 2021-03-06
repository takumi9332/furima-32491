class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products
  has_many :purchases
  has_one :card, dependent: :destroy

  validates :nickname, presence: true
  validates :birth_date, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' ,on: :update, allow_blank: true
end
