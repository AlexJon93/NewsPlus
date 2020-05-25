class PostsController < ApplicationController
    before_action :check_login, only: [:index]

    def index
        @recent_users = User.order(:last_active_at)
        @posts = Post.order(:created_at)

        @topics = ['A.I.', 'V.R.', 'RMIT', 'Games', 'Rails', 'Go', 'Web', 'M.L.', 'Joke', 'React', 'Vue', 'Node', 'iOS', 'AWS']

        @popular_posts = Post.order(:views)
    end
end