class Post < ApplicationRecord
  
  #アソシエーション
  belongs_to :member
  belongs_to :category
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  #バリデーション
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :spot_name, presence: true
  validates :taken_at, presence: true
  
end
