class PostComment < ApplicationRecord
  
# --------------- アソシエーション --------------
  belongs_to :member
  belongs_to :post
  
# --------------- バリデーション --------------
  validates :body, presence: true
end