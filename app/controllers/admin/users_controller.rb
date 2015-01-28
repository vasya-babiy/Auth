class Admin::UsersController < ApplicationController

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to admin_admins_path(@admin)
		else
			render 'edit'
		end
	end
end