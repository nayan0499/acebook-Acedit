class UserProfilesController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find_by(username: params[:username])
        @current_username = current_user.username
        @username = params[:username]
        @posts = Post.where(user_id: @user.id).order("created_at ASC")

        # Set @current_id if a user is signed in
        @current_id = current_user.id if user_signed_in?

        if @user
            render 'user_profiles/user_profile'
        else
            render 'user_profiles/username_error'
        end
      end
end
