class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #gem refile(画像アップロード)用
  attachment :profile_image
  attachment :background_image

  #アソシエーション
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :followed_id, dependent: :destroy
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

  #enum 性別
  enum gender: {
    Male:1, Female:2, Secret:3
  }

  #enum 都道府県
  enum living_prefecture: {
    Hokkaido:1, Aomori:2, Iwate:3, Miyagi:4, Akita:5, Yamagata:6, Fukushima:7,
    Ibaraki:8, Tochigi:9, Gunma:10, Saitama:11, Chiba:12, Tokyo:13, Kanagawa:14,
    Niigata:15, Toyama:16, Ishikawa:17, Fukui:18, Yamanashi:19, Nagano:20,
    Gifu:21, Shizuoka:22, Aichi:23, Mie:24,
    Shiga:25, Kyoto:26, Osaka:27, Hyogo:28, Nara:29, Wakayama:30,
    Tottori:31, Shimane:32, Okayama:33, Hiroshima:34, Yamaguchi:35,
    Tokushima:36, Kagawa:37, Ehime:38, Kochi:39,
    Fukuoka:40, Saga:41, Nagasaki:42, Kumamoto:43, Oita:44, Miyazaki:45, Kagoshima:46,
    Okinawa:47
  }
end
