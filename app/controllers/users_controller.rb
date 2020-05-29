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

  def edit
    @user = User.find(params[:id])
  end

  def posts
    @user = User.find(params[:id])
  end

  def comments
    @user = User.find(params[:id])
  end

  def replies
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'User created!'
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def upload_image
    uploaded_image = params[:image_id]
    image_size = uploaded_image.size / 1024 / 1024
    filename = uploaded_image.original_filename
    @user = User.find(params[:id])

    if params[:type] == 'avatar'
      puts 'avatar'
      @user.image_id = filename
      
    else
      puts 'verify'
      @user.verification = filename
    end
    
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
