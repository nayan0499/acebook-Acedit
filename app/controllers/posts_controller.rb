class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id # Set the user_id attribute
    if @post.save
      # Handle successful post creation
      redirect_to posts_url
    # else
    #   # Handle errors
    end
  end

  def index
    @posts = Post.all
    @current_id = current_user.id
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
      redirect_to posts_url, notice: "Post deleted successfully."
    else
      redirect_to posts_url, alert: "You are not authorized to delete this post."
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
