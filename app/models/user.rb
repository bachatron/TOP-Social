class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :liked_posts, through: :likes, source: :post

  # Following relationships (you follow others)
  has_many :active_relationships,
           class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy

  has_many :following,
           through: :active_relationships,
           source: :followed

  # Followers (others follow you)
  has_many :passive_relationships,
           class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy

  has_many :followers,
           through: :passive_relationships,
           source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def follow(other_user)
    active_relationships.create(followed: other_user)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed: other_user)&.destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def relationship_with(user)
    active_relationships.find_by(followed: user)
  end

  def liked?(post)
    likes.exists?(post: post)
  end
end
