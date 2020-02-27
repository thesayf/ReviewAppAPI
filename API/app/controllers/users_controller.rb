class UsersController < ApplicationController
    skip_before_action :authorize, only: [:index]


    def index
        users = User.all
        # render json: users, except: :posts
        render json: { users: users.as_json( except: :posts) }
    end

    def view_one_user
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create_new_user
        creater_user = User.create(name: params[:name], email: params[:email], password: params[:password], image: params[:image])
        render json: creater_user
    end

    def follow_user
       followed_user =  @current_user.follow!(params[:other_user])
       render json: followed_user
    end

    def unfollow_user
        @current_user.unfollow(params[:other_user])
    end

    def all_followers
       all_followers = @currentuser.followers
       render json: all_followers
    end

    def all_followed_users
        all_followed_users = @current_user.followed_users
        render json: all_followed_users
    end

    def login_current_user
        if @current_user
            render json: { user: @current_user }, status: :accepted
        else
            user = User.create_user_from_google_credentials(decode_token(params[:_json]))
            if user
                render json: { user: user }
            else
                render json: { error: "couldn't create user" }
            end
        end
    end

end
