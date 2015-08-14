class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  before_action :require_creator, only: [:edit, :update]

  def index
    if logged_in?
      @posts = Post.limit(Post::PER_PAGE).offset(params[:offset]).order(created_at: :desc).where(recommended: true)
      @pages = (Post.all.size.to_f / Post::PER_PAGE).ceil
      @posts_this_month = Post.limit(Post::PER_PAGE).offset(params[:offset]).where(created_at: (Time.now.midnight - 30.day)..Time.now.midnight).order(created_at: :desc)
    else
      render 'home'
    end
  end

  def home
  end

  def show
    @comment = Comment.new
    @category = Category.find_by slug: params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

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
    if @post.update(post_params)
      flash[:notice] = "The post was update"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "You voted successfully."
        else
          flash[:error] = "You've already voted on this"
        end
        redirect_to :back
      end
      format.js
    end
  end

  def destroy
    Post.find_by(slug: params[:id]).destroy
    flash[:success] = "Post Deleted"
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit!
  end

  def set_post
    @post = Post.find_by slug: params[:id]
  end

  def require_creator
    access_denied unless logged_in? and (current_user == @post.creator || current_user.admin?)
  end

  def time_period
  end
end
