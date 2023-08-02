class PostsController < ApplicationController
  def index
    @my_user = User.find(params[:user_id])
    @my_posts = @my_user.posts.includes(:comments, :likes)
  end

  def show
    @my_post = Post.find(params[:id])
  end

  def new
    @my_post = Post.new
  end

  def create
    @my_post = current_user.posts.new(post_params)

    if @my_post.save
      redirect_to user_path(id: @my_post.author_id), notice: 'Post created :)'
    else
      flash.now[:alert] = 'There is something wrong try again.'
      render :new
    end
  end

  def destroy
    @my_post = Post.find(params[:id])
    @my_author = @my_post.author
    @my_author.decrement!(:number_of_post)
    @my_post.destroy!
    redirect_to user_posts_path(id: @my_author.id), notice: 'Post removed :)'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
