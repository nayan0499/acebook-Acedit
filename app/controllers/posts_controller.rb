class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :store_previous_path, only: [:new]

  def new
    @post = Post.new
  
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # Set the user_id attribute

    if @post.save
      redirect_to session.delete(:previous_path) || posts_path
    end
  end

  def index
    # @posts = Post.all
    @posts = Post.includes(:user).all # this links all posts individually with the associated user.
    @username = current_user.username # this sets the associated username.
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
