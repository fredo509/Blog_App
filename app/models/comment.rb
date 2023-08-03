class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :post
  after_save :update_comments_number
  after_destroy :decrease_comments_counter

  validates :text, presence: true, length: { in: 2..100 }

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_comments_counter
    post.decrement!(:comments_counter)
  end
end
