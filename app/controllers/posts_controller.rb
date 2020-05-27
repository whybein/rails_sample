class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy, :edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    3.times { @post.hashtags.new }
  end

  def show
    # @post = Post.find(params[:id])
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    # @post.title = params[:post][:title]
    # @post.content = params[:post][:content]

    3.times do |x|
      tag = hashtag_params[:hashtags_attributes]["#{x}"]["title"].strip
      hashtag = Hashtag.find_or_create_by(title: tag)
      @post.hashtags << hashtag
    end
    if @post.save
      redirect_to posts_path, notice: '게시물이 성공적으로 작성되었습니다!'
    else
      render :new
    end
  # redirect_to posts_path
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    # post.title = params[:post][:title]
    # post.content = params[:post][:content]
    # post.save
    respond_to do |format|
      if @post.update(post_params)
        redirect_to posts_path, notice: '게시물이 성공적으로 수정되었습니다'
      else
        render :edit
      end
    end
    # redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :content, :image_url)
  end

  def hashtag_params
    params.require(:post).permit(hashtags_attributes: [:title])
  end
end
