class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #アソシエーション
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :folloed_id, dependent: :destroy
  has_many :follower_id, dependent: :destroy
  
  #バリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :user_name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :email, presence: true
  validates :living_prefecture, presence: true
  
  #退会済みの場合、ログイン不可機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  #フォロー機能
  
end
