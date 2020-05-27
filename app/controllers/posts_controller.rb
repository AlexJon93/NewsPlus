class PostsController < ApplicationController

    def index
        session[:filter] = 'recent'
        session[:toggled] = []

        @posts = Post.order(:created_at)

        @popular_posts = Post.order(:views)
        @recent_users = User.order(:last_active_at)

        @topics = Post.topics
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path
        else
            flash[:danger] = @post.errors.full_messages
            redirect_to new_post_path
        end
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

    private
        def post_params
            params.require(:post).permit(:topic, :title, :content)
        end
end