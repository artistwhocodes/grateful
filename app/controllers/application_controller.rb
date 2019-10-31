class ApplicationController < ActionController::Base
  # Display root page. If current user, show user page.
  helper_method :current_user , :logged_in? ,:authenticate , :belong_to_user? , :authorize?

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  rescue_from ActionController::RoutingError, :with => :rescue404

  def rescue404
   render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
  end

  def rescue403
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  private

  # def render_not_found
  #  render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  # end
  #
  # def rescue403
  #  render :file => "#{RAILS_ROOT}/public/403.html",  :status => 403
  # end

  def index
   redirect_to current_user if current_user
  end

  def logged_in?
  !!current_user
  end

  # Set current user
  def current_user
   User.find_by(id: session[:user_id])
  end

  def authenticate
   redirect_to login_path if !logged_in?
  end

  def belong_to_user?(post)
    post.user_id == current_user.id
  end

  def authorize(post)
    rescue403 if !belong_to_user?(post)
  end

end
