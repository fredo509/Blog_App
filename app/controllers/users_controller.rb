class UsersController < ApplicationController
  def index
    @my_users = User.all.includes(:posts)
    @my_users.each do |user|
      user.number_of_post = user.posts.count
      user.save
    end
  end

  def show
    @my_user = User.find(params[:id])
    @my_user.number_of_post = @my_user.posts.count
  end
end
