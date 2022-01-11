class AddColumns < ActiveRecord::Migration[5.2]
  def change
    #membersテーブル
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :last_name_kana, :string
    add_column :members, :first_name_kana, :string
    add_column :members, :user_name, :string
    add_column :members, :gender, :integer
    add_column :members, :birthday, :date
    add_column :members, :living_prefecture, :integer
    add_column :members, :favorite_word, :string
    add_column :members, :is_deleted, :boolean

    #postsテーブル
    add_column :posts, :member_id, :integer
    add_column :posts, :category_id, :integer
    add_column :posts, :prefecture, :integer
    add_column :posts, :city, :string
    add_column :posts, :spot_name, :string
    add_column :posts, :body, :text
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :posts, :taken_at, :date

    #post_commentsテーブル
    add_column :post_comments, :member_id, :integer
    add_column :post_comments, :post_id, :integer
    add_column :post_comments, :body, :text

    #post_likesテーブル
    add_column :post_likes, :member_id, :integer
    add_column :post_likes, :post_id, :integer

    #categoriesテーブル
    add_column :categories, :category, :string

    #relationshipsテーブル
    add_column :relationships, :follows_id, :integer
    add_column :relationships, :followers_id, :integer

    #contactsテーブル
    add_column :contacts, :name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :message, :text
  end
end
