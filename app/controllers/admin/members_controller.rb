class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :withdraw]
  
# --------------- 会員詳細ページ --------------
  def index
    @members = Member.all
  end
  
# --------------- 強制退会機能 --------------
  def withdraw
  end
  
  private
# --------------- ストロングパラメータ --------------
# --------------- 管理者を定義(before_action用) --------------
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name,
      :gender, :birthday, :email, :living_prefecture, :favorite_word, :profile_image, :header_image, :is_deleted )
  end

  def ensure_correct_member
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to member_path(current_member)
    end
  end
end
