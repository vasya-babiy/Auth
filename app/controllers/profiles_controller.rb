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
		
		if @profile.update_attributes(params[:profile])
			redirect_to user_profile_path(@user)
		else
			render 'edit'
		end
	end
end
