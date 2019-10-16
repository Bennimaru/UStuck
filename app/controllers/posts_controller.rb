class PostsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comment = Comment.new
    @comments = Comment.where("post_id=#{@post.id}")
    @post.punch(request)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

private

  def post_params
    params.require(:post).permit(:title,:content,:user_id,:category_id)
  end

end
