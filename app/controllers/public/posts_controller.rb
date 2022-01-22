class Public::PostsController < ApplicationController

  #個人の投稿一覧画面
  def index
    @posts = Post.all
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
    @post_comment = PostComment.new
    #Google Map Api用(gonはRailsからJSに変数を渡すためのgem)
    gon.post = @post
  end
  
  def map
    results = Geocoder.search(params[:city])
    @latlng = results.first.coordinates
  # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    
    # respond_to以下の記述によって、remote: trueのアクセスに対して、map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_path
  end

  #検索機能
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end

  private
  def post_params
    params.require(:post).permit(:category, :prefecture, :city, :spot_name, :body, :latitude, :longtitude, :taken_at, images: [] )
  end

end
