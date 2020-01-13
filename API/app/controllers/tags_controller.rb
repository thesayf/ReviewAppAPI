class TagsController < ApplicationController

    def search_tags
        tags = Tag.search(params[:query])
        # tags = Tag.find_by(name: params[:query])
        render json: tags
    end
end
