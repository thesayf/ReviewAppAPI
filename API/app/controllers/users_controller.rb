class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
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


end
