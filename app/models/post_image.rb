class PostImage < ApplicationRecord

  #gem refile(画像アップロード)用
  attachment :image

  #アソシエーション
  belongs_to :post
  has_many :post_likes

  #バリデーション無し

end
