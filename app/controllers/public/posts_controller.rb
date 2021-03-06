class Public::PostsController < ApplicationController
# --------------- 全体：投稿一覧ページ --------------
  def index
    @posts = Post.prefectures.map{ | k,v | Post.where(prefecture: k).order(taken_at: :desc).limit(1)}
  end

# --------------- 全体：投稿一覧ページ(都道府県別) --------------
  def index_pref
    @posts = Post.with_attached_images.where(prefecture: params[:prefecture_id]).order(city: :desc)
  end

# --------------- 投稿詳細ページ --------------
  def show
    @post = Post.with_attached_images.find(params[:id])
    @comment = PostComment.new
    #Google Map Api用(gonはRailsからJSに変数を渡すためのgem)
      gon.post = @post
    @member = @post.member
    #Google Translate API用(Googlt Vision Apiのタグ日本語化)
      if @post.tags.present?
        project_id = ENV["CLOUD_PROJECT_ID"]
        translate   = Google::Cloud::Translate.new version: :v2, project_id: project_id
        texts = @post.tags.distinct.pluck(:name)
        target = "ja"
        @translations = translate.translate texts, to: target
      end
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
      @post.images.each do |image|
        tags = Vision.get_image_data(image)
        tags.each do |tag|
          @post.tags.create(name: tag)
        end
      end
      redirect_to post_path(@post)
    else
      render "new"
    end
  end

# --------------- 投稿内容編集ページ --------------
  def edit
    @post = Post.find(params[:id])
  end

# --------------- 投稿内容更新機能 --------------
  def update
    @post = Post.find(params[:id])
    @post.member_id = current_member.id
    if  @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

# --------------- 投稿内容削除機能 --------------
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to member_path(current_member)
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
