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
    # You probably want to put this in a service and the result re-used
    tag = search_params.dig(:tag)
    tags = Post.search_by_tags(tag)
    render json: tags
  end

  def search_posts_by_location
    tag = search_params.dig(:tag)
    long = search_params.dig(:long)
    lat = search_params.dig(:lat)
    posts = Post.search_by_tags_and_location(tag: tag, long: long, lat: lat)
    render json: posts
  end

  private

  def search_params
    params.permit(:tag, :long, :lat)
  end
end
