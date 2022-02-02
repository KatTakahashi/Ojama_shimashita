class Public::RelationshipsController < ApplicationController

# --------------- フォロー機能 --------------
 def follow
  current_member.follows(params[:id])
 end

# --------------- フォロー解除機能 --------------
 def unfollow
  current_member.unfollow(params[:id])
 end
end