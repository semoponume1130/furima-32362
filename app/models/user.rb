class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :firstname
    validates :lastname
    validates :firstname_kana
    validates :lastname_kana
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'に全角（漢字・ひらがな・カタカナ）文字を使用してください' } do
    validates :firstname
    validates :lastname
  end

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は6文字以上かつ半角英数字をそれぞれ含めてください' } do
    validates :password
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角(カタカナ)の入力が必須です' } do
    validates :firstname_kana
    validates :lastname_kana
  end
end
