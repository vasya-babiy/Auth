class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception
	helper_method :current_user
	helper_method :current_admin
	helper_method :can_edit?

	private

	# def current_ability
	# 	if current_user
	# 		@current_ability ||= Ability.new(current_user)
	# 	elsif current_admin
	# 		@current_ability ||= Ability.new(current_admin)
	# 	else
	# 		@current_ability ||= Ability.new(User.new)
	# 	end
	# end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_admin
	  @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def can_edit?(user)
		current_user == user || !!current_admin
	end
end
