class LikesController < ApplicationController
 def create
    @i_like = Like.new
    @i_like.author = current_user
    @i_like.post = Post.find(params[:post_id])
    @i_like.save!
    redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id])
  end
end
