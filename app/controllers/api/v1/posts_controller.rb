class Api::V1::PostsController < ApiController
  before_action :find_user, only: [:index]

  def index
    @posts = @user.posts
    render json: @posts
  end

  private

  def find_user
    @user = User.find_by(id: params[:user_id])

    unless @user
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
