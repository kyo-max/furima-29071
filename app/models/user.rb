class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字を含む6文字以上で入力してください。' }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birthday
  end
end
