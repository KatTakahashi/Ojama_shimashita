class Public::RelationshipsController < ApplicationController
 before_action :authenticate_member! only:[:follow, :unfollow]

# --------------- フォロー機能 --------------
 def follow
  current_member.follows(params[:id])
  redirect_to member_path(params[:id])
 end

# --------------- フォロー解除機能 --------------
 def unfollow
  current_member.unfollow(params[:id])
  redirect_to member_path(params[:id])
 end
end