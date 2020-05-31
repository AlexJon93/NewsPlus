class PasswordResetController < ApplicationController
    layout 'initial'

    def new
    end

    def create
        @user = User.find_by_email(params[:password_reset][:email].downcase)
        if @user
            @user.create_reset_digest
            @user.send_reset_email
            flash[:info] = 'Email has been sent with reset link'
            redirect_to login_path
        else
            flash.now[:danger] = 'Invalid details'
            redirect_to new_password_reset_path
        end
    end

    def edit
        @user = User.find_by_email(params[:email])
        if @user.reset_expired?
            flash[:danger] = 'Password reset has expired'
            redirect_to new_password_reset_path
        end
    end

    def update
        @user = User.find_by_email(params[:email])
        if @user.reset_expired?
            flash[:danger] = 'Password reset has expired'
            redirect_to new_password_reset_path
        end
        
        if params[:user][:password].empty?
            flash[:danger] = 'Password field cannot be empty'
            redirect_to edit_password_reset_path(@user.reset_token, email: @user.email)
        elsif @user.update(user_params)
            reset_session
            login @user
            flash[:success] = 'Password has been changed'
            redirect_to root_path
        else
            flash[:danger] = @user.errors.full_messages
            redirect_to edit_password_reset_path(@user.reset_token, email: @user.email)
        end
    end

    private

        def user_params
            params.require(:user).permit(:password, :password_confirmation)
        end
end
