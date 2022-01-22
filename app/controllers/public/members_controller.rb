class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @post = Post.find(params[:id])
    gon.visiteds = Post.where(member_id: @member.id).select(:prefecture).distinct.order('prefecture').map { |i| Post.prefectures[i.prefecture] }
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

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(current_member.id)
    @member.update(member_params)
    redirect_to root_path
  end

  #退会確認画面
  def confirm
  end

  #退会用アクション(PATCH(=論理削除))
  def withdraw
    @member = current_member
    # is_deletedカラムをtrue(=退会)にupdateする
    @member.update(is_deleted: true)
    # session(ページ遷移しても以前入力した情報を保持する機能)をリセットし、ログアウト
    reset_session
    redirect_to root_path
  end

  #フォロー一覧画面(GET)
  def follows
  end

  #フォロワー一覧画面(GET)
  def followers
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name,
      :gender, :birthday, :email, :living_prefecture, :favorite_word, :profile_image, :background_image, :is_deleted )
  end
end
