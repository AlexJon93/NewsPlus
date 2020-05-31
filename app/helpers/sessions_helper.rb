module SessionsHelper
    # logs in user by setting current session user to the given user
    def login(user)
        session[:user] = user.id
    end

    # returns the currently logged in user by checking session cookie
    def current_user
        if session[:user]
            @current_user ||= User.find_by(id: session[:user])
        end
    end

    # deletes user from current session
    def logout
        session.delete(:user)
        @current_user = nil
    end

    # checks if there is a currently logged in user
    def logged_in?
        !current_user.nil?
    end
end
