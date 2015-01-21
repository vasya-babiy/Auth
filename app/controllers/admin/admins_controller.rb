class Admin::AdminsController < ApplicationController
	def index
		@users = User.all
		@admins = Admin.all
	end

	def show
		@admin = Admin.find(params[:id])
	end

	def new
  	@admin = Admin.new
	end

	def create
  	@admin = Admin.new(params[:admin])
  	if @admin.save
			@admin.create_profile
			redirect_to admin_log_in_path, :notice => "Signed up!"
  	else
    	render 'new'
  	end
	end

	def edit
		@admin = Admin.find(params[:id])
		@admin = current_admin
	end

	def update
		@admin = Admin.find(params[:id])
		if @admin.update_attributes(params[:admin])
			redirect_to admin_admin_path(@admin)
		else
			render 'edit'
		end
	end

	def destroy
		@admin = Admin.find(params[:id])
		@user = User.find(params[:id])
		@admin.destroy
		@user.destroy
		if @user.destroy
      redirect_to admin_admin_path, notice: "User deleted."
    end
	end

end
