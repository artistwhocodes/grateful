class SessionsController < ApplicationController

  # Display login form
  def new
    @user = User.all
  end

  # Log user in
  def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.username}"
        redirect_to user_path(@user)
      else
        flash[:notice] = "✨Improper credentials given✨"
        render :new
      end
  end

  # Log user out
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
