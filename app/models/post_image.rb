class PostImage < ApplicationRecord
  
  #アソシエーション
  belongs_to :post
  has_many :post_likes
  
  #バリデーション無し
  
end
