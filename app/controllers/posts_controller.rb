class PostsController < ApplicationController
    def index
        @posts = Post.order(:created_at)

        @popular_posts = Post.order(:views)
        @recent_users = User.order(:last_active_at)

        @topics = ['A.I.', 'V.R.', 'RMIT', 'Games', 'Rails', 'Go', 'Web', 'M.L.', 'Joke', 'React', 'Vue', 'Node', 'iOS', 'AWS']
        @@toggled_topic = []
    end

    def update_home
        case params[:value]
        when 'filtered'
            @posts = Post.where(topic: @toggled_topic)
        when 'topic'
            @@toggled_topic.push(params[:topic])
        else
            @posts = Post.order(:created_at)
        end

        respond_to do |format|
            format.js
        end
    end
end