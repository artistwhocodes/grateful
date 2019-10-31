class UsersController < ApplicationController
   before_action :authenticate , only: [:index, :show, :edit , :update]
  # skip_before_action :require_login, only: [:new, :create, :index]

  def index
    @users = User.all
  end
  # Display user page
  def show


    @user = User.find(params[:id])
    @post = @user.posts.find_by(id: params[:id])
  end

  # Display signup form
  def new
    @user = User.new
  end

  # Create user
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :username, :image)
  end

end
