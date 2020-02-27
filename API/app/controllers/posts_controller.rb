class PostsController < ApplicationController
  require 'open-uri'
  require 'json'
  skip_before_action :authorize, only: [:create, :search_tags, :index, :show] 

  def index
      posts = Post.all
      render json: posts, include: [:user, :comments, :tags]
  end

  def show
      post = Post.find_by(id: params[:id])
      render json: post
  end

  def create
      videoURL = Cloudinary::Uploader.upload(File.open(params[:post][:video]), { api_key: "737968659967114", api_secret: "qpIy_ZDhLXISl7ror23rwIGVMzI", cloud_name: "dfqall5sk"})
      created_post = Post.create(title: params[:title], description: params[:caption], video: params[:uri], user_id: params[:userId], latitude: params[:latitude], longitude: params[:longitude])
      created_post.all_tags = JSON::parse(params['tags'])
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

params[:tags][2]