class CommentsController < ApplicationController
  def index
    @my_comments = Comment.all
  end

  def show
    @my_comment = Comment.new
  end

  def create
    @my_comment = Comment.new(comment_params)
  
    respond_to do |format|
      if @my_comment.save
        format.html { redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id]), notice: "Comment Added :)" }
        @my_comment.update_comments_counter
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_comment = Comment.find(params[:id])
    @my_post = @my_comment.post
    @my_post.decrease_comments_counter
    @my_comment.destroy

    respond_to do |format|
      format.html { redirect_to user_post_path(id: @post.id), notice: "Comment deleted :)" }
    end
  end

  private

    def comment_params
      params.fetch(:comment).permit(:text)
    end
end
