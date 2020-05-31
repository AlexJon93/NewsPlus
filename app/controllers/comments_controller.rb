class CommentsController < ApplicationController

    # post path for creating new comments
    def create
        @post = Post.find(params[:post_id])

        @comment = @post.comments.build(content: params[:content], reply_id: params[:reply])
        @comment.user = current_user

        if @comment.save
            redirect_to @post
        else
            flash[:danger] = @comment.errors.full_messages
            redirect_to @post
        end
    end
end