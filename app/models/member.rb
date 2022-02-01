class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  has_many :posts, dependent: :destroy
  has_many :post_comments #退会してもコメントは残す
  has_many :post_likes, dependent: :destroy
  #フォローする人(=follow)
  has_many :follow, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  #フォローされる人(=followed)
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #自分がフォローしている会員(=following_member)
  has_many :following_member, through: :follow, source: :followed, dependent: :destroy
  #自分をフォローしている会員(follower_member)
  has_many :follower_member, through: :followed, source: :follow, dependent: :destroy

  # フォローする機能
  def follows(member_id)
   follow.create(followed_id: member_id)
  end
  # フォローを外す機能
  def unfollow(member_id)
   follow.find_by(followed_id: member_id).destroy
  end
  # フォロー確認をおこなう機能
  def following?(member)
   following_member.include?(member)
  end

  #active strage(画像アップロード)用
  has_one_attached :profile_image
  has_one_attached :header_image

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


  #フォロー機能

  #enum 性別
  enum gender: {
    Male:1, Female:2, Secret:3
  }

  #enum 会員登録用(都道府県)
  enum living_prefecture: {
    Private:0,
    #北海道・東北地方
    Hokkaido:1, Aomori:2, Iwate:3, Miyagi:4, Akita:5, Yamagata:6, Fukushima:7,
    #関東地方
    Ibaraki:8, Tochigi:9, Gunma:10, Saitama:11, Chiba:12, Tokyo:13, Kanagawa:14,
    #中部地方
    Niigata:15, Toyama:16, Ishikawa:17, Fukui:18, Yamanashi:19, Nagano:20,
    Gifu:21, Shizuoka:22, Aichi:23, Mie:24,
    #近畿地方
    Shiga:25, Kyoto:26, Osaka:27, Hyogo:28, Nara:29, Wakayama:30,
    #中国地方
    Tottori:31, Shimane:32, Okayama:33, Hiroshima:34, Yamaguchi:35,
    #四国地方
    Tokushima:36, Kagawa:37, Ehime:38, Kochi:39,
    #九州・沖縄地方
    Fukuoka:40, Saga:41, Nagasaki:42, Kumamoto:43, Oita:44, Miyazaki:45, Kagoshima:46,
    Okinawa:47
  }

end
