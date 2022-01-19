class Public::MembersController < ApplicationController

  def show
    @member = Member.find(params[:id])
    @post = Post.find(params[:id])
    
    # @hairetu #[1,3,4,6]
    # @hairetu = @member.Post.where.....  #distinct
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
