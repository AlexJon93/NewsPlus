class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      flash[:success] = 'login successful!'
      redirect_to login_path
    else
      flash[:danger] = 'Invalid password/username combination'
      redirect_to login_path
    end
  end

  def destroy
  end
end
