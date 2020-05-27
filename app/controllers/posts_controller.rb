class PostsController < ApplicationController

    def index
        session[:filter] = 'recent'
        session[:toggled] = []

        @posts = Post.order(:created_at)

        @popular_posts = Post.order(:views)
        @recent_users = User.order(:last_active_at)

        @topics = ['A.I', 'V.R', 'RMIT', 'Games', 'Rails', 'Go', 'Web', 'M.L.', 'Joke', 'React', 'Vue', 'Node', 'iOS', 'AWS']
    end

    def update_home
        if !params[:filter].nil?
            session[:filter] = params[:filter]
        end

        if !params[:topic].nil?
            topic = params[:topic]
            session[:toggled].include?(topic) ? session[:toggled].delete(topic) : session[:toggled].push(topic)
        end

        case session[:filter]
        when 'filtered'
            @posts = Post.where(topic: session[:toggled])
        else
            @posts = Post.order(:created_at)
        end

        respond_to do |format|
            format.js
        end
    end
end