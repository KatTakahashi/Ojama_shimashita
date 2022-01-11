class Public::PostsController < ApplicationController

  #個人の投稿一覧画面
  def index
  end

  #個人の投稿一覧画面(都道府県別)
  def index_pref
  end

  #全体の投稿一覧画面
  def index_all
  end

  #全体の投稿一覧画面(都道府県別)
  def index_pref_all
  end

  #投稿詳細画面
  def show
    @post = Post.find(params[:id])
  end

  #新規投稿画面
  def new
    @post = Post.new
  end

  #新規投稿機能
  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save(post_params)
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  #投稿編集画面
  def edit
    @post = Post.find(params[:id])
  end

  #投稿内容更新機能
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  #投稿削除機能
  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:prefecture, :city, :spot_name, :body, :latitude, :longtitude, :taken_at, images: [] )
  end

end
