class UsersController < ApplicationController
  before_action :check_login, only: [:home]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created!'
      redirect_to login_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def home
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :mobile, :password, :password_confirmation)
    end

    def check_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
