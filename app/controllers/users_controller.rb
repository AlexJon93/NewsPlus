class UsersController < ApplicationController
  layout 'initial', only: [:new]

  # controller method for user registration page
  def new
    @user = User.new
  end

  # controller method for user show view
  def show
    @user = User.find(params[:id])
  end

  # post path for user creation
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

  # controller method for the user settings page
  def edit
    @user = User.find(params[:id])
  end

  # controller method for the users' posts page
  def posts
    @user = User.find(params[:id])
  end

  # controller method for the users' comments page
  def comments
    @user = User.find(params[:id])
  end

  # controller method for the users' received comments page
  def replies
    @user = User.find(params[:id])
  end

  # post path for editting user details
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'User updated!'
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  # method for saving posted image locally
  def upload_image
    uploaded_image = params[:image_id]
    image_size = uploaded_image.size / 1024 / 1024
    filename = uploaded_image.original_filename
    @user = User.find(params[:id])

    # gets the type of image and saves relevant user variable
    if params[:type] == 'avatar'
      @user.image_id = filename
    else
      @user.verification = filename
    end
    
    # saves the file locally if image size is <= 2MB and filename is not nil
    if @user.save and image_size <= 2
      File.open(Rails.root.join('app', 'assets', 'images', filename), 'wb') do |file|
        file.write(uploaded_image.read)
      end
      flash[:success] = 'Image uploaded!'
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = 'Could not upload image, verify that size less than 2MB'
      redirect_to edit_user_path(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :mobile, :intro, :city, :password, :password_confirmation)
    end
end
