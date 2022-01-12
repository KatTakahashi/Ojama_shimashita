class Post < ApplicationRecord

  #アソシエーション
  belongs_to :member
  # belongs_to :category
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy

  #いいね機能用メソッド
  def liked_by?(member)
    post_likes.where(member_id: member.id).exists?
  end

  #active strage(画像アップロード)用
  has_many_attached :images

  #バリデーション
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :spot_name, presence: true
  validates :taken_at, presence: true

  #enum 投稿用(都道府県)
  enum prefecture: {
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
  
  #enum 投稿用(カテゴリー)
  enum category: {
    #自然系
    Mountain:1, River:2, Sea:3, Lake:4,
    #観光地系
    City:11, Town:12, Park:13, Hotsprings:14, Building:15, Religious_facility:16, Histrical_facility:17, Festival:18,
    #食事系
    Restaurant:21, Cafe: 22,
    #乗り物系
    Train:31, Airplane:32, Car:33, Mortorbike: 34,
    #その他
    Other:41
  }
end
