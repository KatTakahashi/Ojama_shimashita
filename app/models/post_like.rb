class PostLike < ApplicationRecord

  #アソシエーション
  belongs_to :member
  belongs_to :post

  #バリデーション

end
