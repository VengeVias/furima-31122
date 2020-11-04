class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :logs

  with_options presence: true do
    validates :email, uniqueness: true
    validates :password, format:{ with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    validates :nickname
    validates :firstname, format:{ with:/\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname, format:{ with:/\A[ぁ-んァ-ン一-龥]/ }
    validates :firstname_kana, format:{ with:/\A[ァ-ヶー－]+\z/ }
    validates :lastname_kana, format:{ with:/\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
