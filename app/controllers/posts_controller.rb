class PostsController < ApplicationController
    before_action :check_login, only: [:index]

    def index
    end
end