class Public::PostsController < ApplicationController

# --------------- 個人：投稿一覧ページ --------------
  def index
    @posts = Post.all
  end

# --------------- 個人：投稿一覧ページ(都道府県別) --------------
  def index_pref
  end

# --------------- 全体：投稿一覧ページ --------------
  def index_everyone
  end

# --------------- 全体：投稿一覧ページ(都道府県別) --------------
  def index_pref_everyone
  end

# --------------- 投稿詳細ページ --------------
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    #Google Map Api用(gonはRailsからJSに変数を渡すためのgem)
      gon.post = @post
    @member = @post.member
  end

# --------------- 新規投稿ページ --------------
  def new
    @post = Post.new
  end

# --------------- 新規投稿機能 --------------
  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save(post_params)
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

# --------------- 投稿内容編集ページ --------------
  def edit
    @post = Post.find(params[:id])
  end

# --------------- 投稿内容更新機能 --------------
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

# --------------- 投稿内容削除機能 --------------
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_path
  end

# --------------- 検索ページ --------------
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end

  private
# --------------- ストロングパラメータ --------------
  def post_params
    params.require(:post).permit(:category, :prefecture, :city, :spot_name, :body, :latitude, :longtitude, :taken_at, images: [] )
  end

end
