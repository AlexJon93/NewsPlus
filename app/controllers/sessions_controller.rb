class SessionsController < ApplicationController
  layout 'initial', only: [:new]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login user
      flash[:success] = 'Login successful!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid password/username combination'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
