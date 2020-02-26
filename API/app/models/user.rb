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

    # def self.set_current_user_with_uid(google_uid)
    #     # run when user signs in, use the uid to match a user, if match, set @current_user using user_id, 
    #     #  if no match create a user using uid and google credentials and again set as @current_user

    #     user = User.find_by(uid: google_uid)
    #     if user
    #         @current_user = user
    #     else 
    #         @current_user = nil
    #     end
    #     # can probably just have @current_user = User.find_by(uid: params[:uid]) if the return value is also nil if not found
    # end

    def self.create_user_from_google_credentials(params)
        byebug
        # user = User.create(
        #     name: params[:displayName], 
        #     email: params[:email], 
        #     image: params[:photoURL], uid: 
        #     params[:uid])
        

        User.create(
            name: params['name'], 
            email: params['email'], 
            image: params['picture'], 
            uid: params['user_id'],
        )
        # @current_user = user
        # user, send back user or errors
    end

end
