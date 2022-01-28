class Public::PostCommentsController < ApplicationController

# --------------- コメント投稿機能 --------------
  def create
    post = Post.find(params[:post_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(params[:post_id])
  end

# --------------- コメント削除機能 --------------
  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
# --------------- ストロングパラメータ --------------
  def post_comment_params
    params.require(:post_comment).permit(:body)
  end


end
