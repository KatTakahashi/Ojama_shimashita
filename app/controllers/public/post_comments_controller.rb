class Public::PostCommentsController < ApplicationController

# --------------- コメント投稿機能 --------------
  def create
    @post = Post.find(params[:post_id])
    @comment = current_member.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    @comment.save
    render :post_comment
  end

# --------------- コメント削除機能 --------------
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @post = Post.find(params[:post_id])
    render :post_comment
  end

  private
# --------------- ストロングパラメータ --------------
  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end
