class PostsController < ApplicationController

def index
    posts = Post.all
    render json: posts, include: [:user, :comments, :tags] 
end

def view_one_post 
    post = Post.find_by(id: params[:id])
    render json: post
end

def create_new_post
    videoURL = Cloudinary::Uploader.upload(params[:video], { api_key: "737968659967114", api_secret: "qpIy_ZDhLXISl7ror23rwIGVMzI", cloud_name: "dfqall5sk"})
    created_post = Post.create(title: params[:title], description: params[:description], video: params[:videoURL], user_id: params[:user_id], latitude: params[:latitude], longitude: params[:longitude], address: params[:address])
    created_post.all_tags = params[:tags]
    render json: created_post
end

def search_tags
    tags = Tag.search(params[:query])
    render json: tags
end

def search_posts_by_location
    # posts = Post.search "*"
    # posts = Post.search "*"
    posts = Post.search(param[:query])
    # fields: ["tags"]
    # byebug
    # posts = Post.search "resturaunt", where:{"tags.name" => "resturaunt"}
#    posts = Post.search params[:query], where: {location: {near: {lat: 52, lon: -1}, within: "10mi"}}
   render json: posts
end


end
