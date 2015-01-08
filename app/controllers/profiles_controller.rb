class ProfilesController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile
		
		respond_to do |format|

			if @profile.update_attributes(params[:profile])
				format.html {redirect_to user_profile_path(@user)}
				format.js {}
			else
				format.html {render 'edit'}
			end
		end
	end
end
