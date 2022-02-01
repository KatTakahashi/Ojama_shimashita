class Admin::MembersController < ApplicationController

# --------------- 会員詳細ページ --------------
  def index
    @members = Member.all
  end

# --------------- 会員情報編集ページ --------------
  def edit
    @member = Member.find(params[:id])
  end

# --------------- 会員情報更新機能 --------------
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_members_path
  end

# --------------- 強制退会機能 --------------
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path
  end

  private
# --------------- ストロングパラメータ --------------
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name,
      :gender, :birthday, :email, :living_prefecture, :favorite_word, :profile_image, :header_image, :is_deleted )
  end
end
