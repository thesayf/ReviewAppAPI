class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :reverse_relationships, source: :follower

    def following?(other_user)
        relationships.find_by(followed_id: other_user.id)
    end

    def follow!(other_user)
        byebug
        relationships.create(followed_id: other_user.id)
    end

    def unfollow(other_user)
        relationships.find_by(followed_id: other_user.id).destroy
    end

end
