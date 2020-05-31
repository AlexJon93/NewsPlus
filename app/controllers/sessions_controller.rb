class SessionsController < ApplicationController
  layout 'initial', only: [:new]
  
  # controlled method for login page
  def new
  end

  # post path for creating a new session
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login user
      params[:session][:remember] == '1' ? remember(user) : forget(user)
      flash[:success] = 'Login successful!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid password/username combination'
      redirect_to login_path
    end
  end

  # post path for deleting current session
  def destroy
    logout if logged_in?
    redirect_to login_path
  end
end
