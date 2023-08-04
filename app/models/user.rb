class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  attribute :email, :string
  attribute :username, :string
  attribute :encrypted_password, :string

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }


  def update_posts_counter
    update(number_of_post: posts.count)
  end
end
