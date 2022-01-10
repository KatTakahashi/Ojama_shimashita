class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    #membersテーブル
    change_column_null :members, :last_name, false
    change_column_null :members, :first_name, false
    change_column_null :members, :last_name_kana, false
    change_column_null :members, :first_name_kana, false
    change_column_null :members, :user_name, false
    change_column_null :members, :gender, false
    change_column_null :members, :birthday, false
    #change_column_null :members, :email, false
    change_column_null :members, :living_prefecture, false
    #change_column_null :members, :encrypted_password, false
    #change_column_null :members, :favorite_word, false
    #change_column_null :members, :profile_image_id, false
    #change_column_null :members, :background_image_id, false
    change_column_null :members, :is_deleted, false

    #postsテーブル
    change_column_null :posts, :member_id, false
    change_column_null :posts, :category_id, false
    change_column_null :posts, :prefecture, false
    change_column_null :posts, :city, false
    change_column_null :posts, :spot_name, false
    #change_column_null :posts, :body, false
    #change_column_null :posts, :latitude, false
    #change_column_null :posts, :longitude, false
    change_column_null :posts, :taken_at, false

    #post_imagesテーブル
    change_column_null :post_images, :post_id, false
    # change_column_null :post_images, :image_id, false

    #post_commentsテーブル
    change_column_null :post_comments, :member_id, false
    change_column_null :post_comments, :post_id, false
    change_column_null :post_comments, :body, false

    #post_likesテーブル
    change_column_null :post_likes, :member_id, false
    change_column_null :post_likes, :post_image_id, false

    #categoriesテーブル
    change_column_null :categories, :category, false

    #relationshipsテーブル
    #change_column_null :relationships, :follows_id, false
    #change_column_null :relationships, :followers_id, false

    #contactsテーブル
    change_column_null :contacts, :name, false
    change_column_null :contacts, :email, false
    change_column_null :contacts, :message, false
  end

  def down
    #membersテーブル
    change_column_null :members, :last_name, true
    change_column_null :members, :first_name, true
    change_column_null :members, :last_name_kana, true
    change_column_null :members, :first_name_kana, true
    change_column_null :members, :user_name, true
    change_column_null :members, :gender, true
    change_column_null :members, :birthday, true
    #change_column_null :members, :email, true
    change_column_null :members, :living_prefecture, true
    #change_column_null :members, :encrypted_password, true
    #change_column_null :members, :favorite_word, true
    #change_column_null :members, :profile_image_id, true
    #change_column_null :members, :background_image_id, true
    change_column_null :members, :is_deleted, true

    #postsテーブル
    change_column_null :posts, :member_id, true
    change_column_null :posts, :category_id, true
    change_column_null :posts, :prefecture, true
    change_column_null :posts, :city, true
    change_column_null :posts, :spot_name, true
    #change_column_null :posts, :body, true
    #change_column_null :posts, :latitude, true
    #change_column_null :posts, :longitude, true
    change_column_null :posts, :taken_at, true

    #post_imagesテーブル
    change_column_null :post_images, :post_id, true
    # change_column_null :post_images, :image_id, true

    #post_commentsテーブル
    change_column_null :post_comments, :member_id, true
    change_column_null :post_comments, :post_id, true
    change_column_null :post_comments, :body, true

    #post_likesテーブル
    change_column_null :post_likes, :member_id, true
    change_column_null :post_likes, :post_image_id, true

    #categoriesテーブル
    change_column_null :categories, :category, true

    #relationshipsテーブル
    #change_column_null :relationships, :follows_id, true
    #change_column_null :relationships, :followers_id, true

    #contactsテーブル
    change_column_null :contacts, :name, true
    change_column_null :contacts, :email, true
    change_column_null :contacts, :message, true
  end
end
