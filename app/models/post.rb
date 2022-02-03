class Post < ApplicationRecord

  #active strage(画像アップロード)用
  has_many_attached :images

  #アソシエーション
  belongs_to :member
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :tags, dependent: :destroy

  #バリデーション
  validate :image_type, :image_size, :image_length
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :spot_name, presence: true
  validates :taken_at, presence: true

  #いいね機能用メソッド
  def liked_by?(member)
    post_likes.where(member_id: member.id).exists?
  end

  #検索機能用メソッド
  def self.search(keyword)
    #city, spot_name, bodyカラムの部分一致
    where(["city like? OR spot_name like? OR body like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  #geocoding用
    #複数のカラムからgeocodingするための定義(変数addressにprefecture,city, spot_nameカラムを代入)
    def address
      [self.prefecture_i18n, self.city, self.spot_name].compact.join()
    end

    #postテーブルのcityカラムとspot_nameカラムのデータから緯度経度算出
    geocoded_by :address
    # #postテーブルの投稿内容変更時にも緯度経度算出
    after_validation :geocode, :if => :prefecture||:city||:spot_name_changed?

  #enum 投稿用(都道府県)
  enum prefecture: {
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
    Fukuoka:40, Saga:41, Nagasaki:42, Kumamoto:43, Oita:44, Miyazaki:45, Kagoshima:46, Okinawa:47
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

  private

  # バリデーション用：Active_storageのファイルの種類
  def image_type
    images.each do |image|
      if !image.blob.content_type.in?(%('image/jpg image/jpeg image/png image/heic'))
        image.purge
        errors.add(:images, "はjpg, jpegまたはpng形式でアップロードしてください")
      end
    end
  end

  # バリデーション用：Active_storageの添付ファイル容量
  def image_size
    images.each do |image|
      if image.blob.byte_size > 8.megabytes
        avatar.purge
        errors.add(:images, "1ファイル8MB以内にしてください")
      end
    end
  end

  # バリデーション用：Active_storageの添付可能枚数
  def image_length
    if images.length > 5
      images.purge
      errors.add(:images, "5枚まで投稿可能です")
    end
  end
end
