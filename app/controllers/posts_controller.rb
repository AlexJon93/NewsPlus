class PostsController < ApplicationController
    # get path for single post on id
    def show
        @post = Post.find(params[:id])
    end

    # main index page for all posts
    def index
        # session values store the currently applied filter, and which topics have been 'toggled'
        session[:filter] = 'recent'
        session[:toggled] = []

        @posts = Post.order(:created_at)
    end

    # controller method for post creation page
    def new
        @post = Post.new
    end

    # post path for creating new posts
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else
            flash[:danger] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    # used to refresh the main content in the post index
    def update_home
        # if the filter param is passed then the session filter is changed
        if !params[:filter].nil?
            session[:filter] = params[:filter]
        end

        # if the topic param is passed then the topic is added/removed from the toggled session value
        if !params[:topic].nil?
            topic = params[:topic]
            session[:toggled].include?(topic) ? session[:toggled].delete(topic) : session[:toggled].push(topic)
        end

        # returns the filter type based on current session filter
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