class Public::PostsController < ApplicationController

# --------------- 全体：投稿一覧ページ --------------
  def index
    # @posts = Post.group(:prefecture)

    @post_1 = Post.where(prefecture: 1).order(updated_at: :desc)
    @post_2 = Post.where(prefecture: 2).order(updated_at: :desc)
    @post_3 = Post.where(prefecture: 3).order(updated_at: :desc)
    @post_4 = Post.where(prefecture: 4).order(updated_at: :desc)
    @post_5 = Post.where(prefecture: 5).order(updated_at: :desc)
    @post_6 = Post.where(prefecture: 6).order(updated_at: :desc)
    @post_7 = Post.where(prefecture: 7).order(updated_at: :desc)
    @post_8 = Post.where(prefecture: 8).order(updated_at: :desc)
    @post_9 = Post.where(prefecture: 9).order(updated_at: :desc)
    @post_10 = Post.where(prefecture: 10).order(updated_at: :desc)
    @post_11 = Post.where(prefecture: 11).order(updated_at: :desc)
    @post_12 = Post.where(prefecture: 12).order(updated_at: :desc)
    @post_13 = Post.where(prefecture: 13).order(updated_at: :desc)
    @post_14 = Post.where(prefecture: 14).order(updated_at: :desc)
    @post_15 = Post.where(prefecture: 15).order(updated_at: :desc)
    @post_16 = Post.where(prefecture: 16).order(updated_at: :desc)
    @post_17 = Post.where(prefecture: 17).order(updated_at: :desc)
    @post_18 = Post.where(prefecture: 18).order(updated_at: :desc)
    @post_19 = Post.where(prefecture: 19).order(updated_at: :desc)
    @post_20 = Post.where(prefecture: 20).order(updated_at: :desc)
    @post_21 = Post.where(prefecture: 21).order(updated_at: :desc)
    @post_22 = Post.where(prefecture: 22).order(updated_at: :desc)
    @post_23 = Post.where(prefecture: 23).order(updated_at: :desc)
    @post_24 = Post.where(prefecture: 24).order(updated_at: :desc)
    @post_25 = Post.where(prefecture: 25).order(updated_at: :desc)
    @post_26 = Post.where(prefecture: 26).order(updated_at: :desc)
    @post_27 = Post.where(prefecture: 27).order(updated_at: :desc)
    @post_28 = Post.where(prefecture: 28).order(updated_at: :desc)
    @post_29 = Post.where(prefecture: 29).order(updated_at: :desc)
    @post_30 = Post.where(prefecture: 30).order(updated_at: :desc)
    @post_31 = Post.where(prefecture: 31).order(updated_at: :desc)
    @post_32 = Post.where(prefecture: 32).order(updated_at: :desc)
    @post_33 = Post.where(prefecture: 33).order(updated_at: :desc)
    @post_34 = Post.where(prefecture: 34).order(updated_at: :desc)
    @post_35 = Post.where(prefecture: 35).order(updated_at: :desc)
    @post_36 = Post.where(prefecture: 36).order(updated_at: :desc)
    @post_37 = Post.where(prefecture: 37).order(updated_at: :desc)
    @post_38 = Post.where(prefecture: 38).order(updated_at: :desc)
    @post_39 = Post.where(prefecture: 39).order(updated_at: :desc)
    @post_40 = Post.where(prefecture: 40).order(updated_at: :desc)
    @post_41 = Post.where(prefecture: 41).order(updated_at: :desc)
    @post_42 = Post.where(prefecture: 42).order(updated_at: :desc)
    @post_43 = Post.where(prefecture: 43).order(updated_at: :desc)
    @post_44 = Post.where(prefecture: 44).order(updated_at: :desc)
    @post_45 = Post.where(prefecture: 45).order(updated_at: :desc)
    @post_46 = Post.where(prefecture: 46).order(updated_at: :desc)
    @post_47 = Post.where(prefecture: 47).order(updated_at: :desc)
  end

# --------------- 全体：投稿一覧ページ(都道府県別) --------------
  def index_pref

    # binding.pry
    @post = Post.where(params[:id])
    @post = params[:format]
    # @item = []
    # @post.each do |f|
    #   @item << f
    # end



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

  def test_params
    params.require(:post).permit(:category, :prefecture, :city, :spot_name, :body, :latitude, :longtitude, :taken_at, images: [], format:[] )
  end



end
