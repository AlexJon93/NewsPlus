class ApplicationController < ActionController::Base
    include SessionsHelper

    def check_login
        unless logged_in?
            redirect_to login_path
        end
    end
end
