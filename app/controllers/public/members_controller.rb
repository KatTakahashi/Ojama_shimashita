class Public::MembersController < ApplicationController
  before_action :ensure_correct_member, only: [:edit, :update]

# --------------- 会員詳細ページ --------------
  def show
    @member = Member.find(params[:id])
    @posts = Post.where(member_id: params[:id]).order('taken_at')
    @posts_count = Post.where(member_id: @member.id)
    @visiteds = Post.where(member_id: @member.id).select(:prefecture).distinct.order('prefecture').map { |i| Post.prefectures[i.prefecture] }
    gon.visiteds = @visiteds
    gon.living = Member.where(id: @member.id).select(:living_prefecture).distinct.order('living_prefecture').map { |i| Member.living_prefectures[i.living_prefecture] }
      #gon(gon.変数名):RailsからJSに変数を渡すためのgem使用
      #where(モデル名.where(条件)):条件に一致するレコードを配列で取得するメソッド
        #Postモデル内のmember_idカラムのデータが@memberであるレコードを全て取得
      #select(select(:取得したいカラム)):取得したいカラムを指定するメソッド
        #whereで取得したデータのprefectureカラムのみに絞り込む
      #distinct:重複したレコードを1つにするメソッド
      #order('基準とするカラム'):配列の順番を並び替えるメソッド
        #取得したデータをprefectureカラム基準(enumの番号順)で昇順に並び替え
      #map(map{|変数名|モデル名.カラム名}[変数名.カラム名]):各要素へ順に処理を実行するメソッド
        #取得したデータがローマ字の都道府県なので、enumの数値に変換
  end

# --------------- 会員情報編集ページ --------------
  def edit
    @member = Member.find(params[:id])
  end

# --------------- 会員情報更新機能 --------------
  def update
    @member = Member.find(current_member.id)
    @member.update(member_params)
    redirect_to member_path(current_member)
  end

# --------------- 退会確認ページ --------------
  def confirm
  end

# --------------- 退会用アクション(PATCH(=論理削除)) --------------
  def withdraw
    @member = current_member
    # is_deletedカラムをtrue(=退会)にupdateする
      @member.update(is_deleted: true)
    # session(ページ遷移しても以前入力した情報を保持する機能)をリセットし、ログアウト
      reset_session
    redirect_to root_path
  end

# --------------- フォロー一覧画面(GET) --------------
  def follows
    @member = Member.find(params[:id])
    @members = @member.following_member
  end

# --------------- フォロワー一覧画面(GET) --------------
  def followers
    @member = Member.find(params[:id])
    @members = @member.follower_member
  end

# --------------- 個人：投稿一覧ページ --------------
  def post_index
  end

# --------------- 個人：投稿一覧ページ(都道府県別) --------------
  def post_index_pref
  end


  private
# --------------- ストロングパラメータ --------------
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name,
      :gender, :birthday, :email, :living_prefecture, :favorite_word, :profile_image, :header_image, :is_deleted )
  end

# --------------- ログイン中の会員を定義(before_action用) --------------
  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
    end
  end
end
