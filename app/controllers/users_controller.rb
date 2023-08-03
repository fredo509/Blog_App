class UsersController < ApplicationController
  def index
    @my_users = User.all
  end

  def show
    @my_user = User.find(params[:id])
    @my_user.number_of_post = @user.posts.count
  end
end
