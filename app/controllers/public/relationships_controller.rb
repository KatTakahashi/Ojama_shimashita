class Public::RelationshipsController < ApplicationController

# --------------- フォロー機能 --------------
 def follow
  current_member.follows(params[:id])
  redirect_to request.referer
 end

# --------------- フォロー解除機能 --------------
 def unfollow
  current_member.unfollow(params[:id])
  redirect_to request.referer
 end
end