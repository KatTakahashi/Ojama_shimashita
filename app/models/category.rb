class Category < ApplicationRecord

  #アソシエーション
  has_many :posts

  #バリデーション
  validates :category, presence: true

end
