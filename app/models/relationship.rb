class Relationship < ApplicationRecord

  #アソシエーション
  belongs_to :follow, class_name: "Member"
  belongs_to :followed, class_name: "Member"

  #バリデーション無し

end
