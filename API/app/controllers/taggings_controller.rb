class TaggingsController < ApplicationController
    def search_taggings
        taggings = params[:query].nil? ? [] : Tagging.search(params[:query]) 
        render json: tags
    end
end
