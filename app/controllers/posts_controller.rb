class PostsController < ApplicationController
    before_action :check_login, only: [:index]

    def index
        @recent_users = [
            {
                username: 'Alex'
            },
            {
                username: 'Stan'
            },
            {
                username: 'Sarah'
            },
            {
                username: 'Guy'
            }
        ]

        @topics = ['A.I.', 'V.R.', 'RMIT', 'Games', 'Rails', 'Go', 'Web', 'M.L.', 'Joke', 'React', 'Vue', 'Node', 'iOS', 'AWS']

        @popular_posts = [
            {
                title: 'MIDI 2.0 Specifications Available for Download',
                views: 685
            }
        ]
    end
end