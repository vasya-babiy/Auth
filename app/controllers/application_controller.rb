class ApplicationController < ActionController::Base
	
helper_method :current_user
helper_method :current_admin

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def current_admin
  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
end

end
