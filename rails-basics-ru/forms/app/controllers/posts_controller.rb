class PostsController < ApplicationController
  before_action :setup_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show;  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
      flash[:success] = 'Post created successfully'
    else
      render :new
      flash[:error] = 'Couldn\'t create post'
    end
  end

  def edit;  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:success] = 'Post updated successfully'
    else
      render :edit
      flash[:error] = 'Couldn\'t update post'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Couldn\'t destroy post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end

  def setup_post
    @post = Post.find(params[:id])
  end
end
