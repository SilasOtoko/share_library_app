class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit!)
    @post.user = User.first # TODO change once we have authentication

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(params.require(:post).permit!)
      flash[:notice] = "The post was update"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
