class Public::PostLikesController < ApplicationController

# --------------- いいね機能 --------------
  def create
    @post = Post.find(params[:post_id])
    post_like = current_member.post_likes.new(post_id: @post.id)
    post_like.save
  end

# --------------- いいね削除機能 --------------
  def destroy
    @post = Post.find(params[:post_id])
    post_like = current_member.post_likes.find_by(post_id: @post.id)
    post_like.destroy
  end
end
