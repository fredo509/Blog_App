class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_likes_counter
  after_destroy :decrease_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end

  def decrease_likes_counter
    post.decrement!(:likes_counter)
  end
end
