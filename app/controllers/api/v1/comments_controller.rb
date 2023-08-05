class Api::V1::CommentsController < ApiController
  before_action :find_post, only: [:index, :create]

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    comment_params = params.require(:comment).permit(:text)
    @comment = @post.comments.new(comment_params)
    @comment.author = @current_user

    if @comment.save
      render json: { success: 'Comment created successfully' }
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post not found' }, status: :not_found
  end
end
