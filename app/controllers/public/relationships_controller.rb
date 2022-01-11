class Public::RelationshipsController < ApplicationController
  
  def follow
   current_member.follows(params[:id])
   redirect_to root_path
  end
  
  def unfollow
   current_member.unfollow(params[:id])
   redirect_to root_path
  end
  
end
