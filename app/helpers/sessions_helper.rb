module SessionsHelper
    def login(user)
        session[:user] = user.id
    end

    def current_user
        if session[:user]
            @current_user ||= User.find_by(id: session[:user])
        end
    end

    def logout
        session.delete(:user)
        @current_user = nil
    end

    def logged_in?
        !current_user.nil?
    end
end
