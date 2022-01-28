class Public::PostLikesController < ApplicationController
  before_action :authenticate_member! only:[:create, :destroy]

# --------------- いいね機能 --------------
  def create
    post = Post.find(params[:post_id])
    post_like = current_member.post_likes.new(post_id: post.id)
    post_like.save
    redirect_to post_path(post)
  end

# --------------- いいね削除機能 --------------
  def destroy
    post = Post.find(params[:post_id])
    post_like = current_member.post_likes.find_by(post_id: post.id)
    post_like.destroy
    redirect_to post_path(post)
  end
end
