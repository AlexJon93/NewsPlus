class UsersController < ApplicationController
  layout 'initial', only: [:new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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

  private
    def user_params
      params.require(:user).permit(:username, :email, :mobile, :password, :password_confirmation)
    end
end
