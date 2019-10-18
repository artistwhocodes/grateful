class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  # Display user page
  def show
    @user = User.find(params[:id])
     
  end

  # Display signup form
  def new
    @user = User.new
  end

  # Create user
  def create


    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Credentials don't work"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :username)
  end

end

  #
  # def index
  #   @users = User.all
  # end
  #
  # def show
  #   @user = User.find(params[:id])
  # end
  #
  # def new
  #   @user = User.new
  # end
  #
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #
  #   @user.update(user_params)
  #
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   flash[:notice] = "User deleted."
  #   redirect_to users_path
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:name)
  # end
