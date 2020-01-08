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
    created_post = Post.create(title: params[:title], description: params[:description], videoURL[:URL], user_id: params[:user_id], latitude: params[:latitude], longitude: params[:longitude], address: params[:address] )
    created_post.all_tags = params[:tags]
    render json: created_post
end


end
