class CommentsController < ApplicationController

    def index
        comments = Comment.all
        render json: comments, include: [:user, :posts]
    end

    def create_new_comment
        comment = Comment.create(content: params[:content], user_id: params[:user_id], post_id: params[:post_id])
        render json: comment
    end

end
