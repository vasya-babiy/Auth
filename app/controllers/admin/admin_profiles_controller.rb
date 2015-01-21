class Admin::AdminProfilesController < ApplicationController
		def show
		@admin = Admin.find(params[:admin_id])
		@admin_profile = @admin.profile 
	end

	def edit
		@admin = Admin.find(params[:admin_id])
		@admin_profile = @admin.profile
	end

	def update
		@admin = Admin.find(params[:admin_id])
		@admin_profile = @admin.profile
		if @admin_profile.update_attributes(params[:profile])
			redirect_to admin_admin_admin_profile_path(@admin)
		else
			render 'edit'
		end
	end
end
