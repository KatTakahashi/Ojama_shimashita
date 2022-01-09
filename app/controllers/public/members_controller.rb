class Public::MembersController < ApplicationController

  def show
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(current_member.id)
    @member.update(member_params)
    redirect_to root_path
  end

  def confirm
  end

  def withdraw
  end

  def follows
  end

  def followers
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name,
      :gender, :birthday, :email, :living_prefecture, :favorite_word, :profile_image, :background_image )
  end
end
