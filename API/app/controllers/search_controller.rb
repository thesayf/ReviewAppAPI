class SearchController < ApplicationController

    def search_post
        posts = params[:query].nil? ? [] : Post.search(params[:query])
        render json: posts 
    end

end
