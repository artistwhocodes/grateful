class ApplicationController < ActionController::Base
  # Display root page. If current user, show user page.
 helper_method :current_user , :logged_in? ,:authenticate


 private

 def render_not_found
   render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
 end

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

end
