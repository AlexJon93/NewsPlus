module SessionsHelper
    # logs in user by setting current session user to the given user
    def login(user)
        session[:user] = user.id
    end

    # remembers a given user
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # forgets currently stored user
    def forget(user)
        user.forget
        cookies.delete(:user)
        cookies.delete(:remember_token)
    end

    # returns the currently logged in user by checking session cookie
    def current_user
        if (user_id = session[:user])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user])
            user = User.find_by(id: user_id)
            if user&.authenticated?(cookies[:remember_token])
                login(user)
                @current_user = user
            end
        end
    end

    # deletes user from current session
    def logout
        forget(current_user)
        session.delete(:user)
        @current_user = nil
    end

    # checks if there is a currently logged in user
    def logged_in?
        !current_user.nil?
    end
end
