class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])

        @comment = @post.comments.build(content: params[:content])
        @comment.user = current_user

        if @comment.save
            redirect_to @post
        else
            flash[:danger] = @comment.errors.full_messages
            redirect_to @post
        end
    end
end