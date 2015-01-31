class UsersController < ApplicationController

	# load_and_authorize_resource

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
  	@user = User.new
		@profile = Profile.new
	end

	def create
  	@user = User.new(params[:user])
  	if @user.save
  		@user.create_profile
    	redirect_to log_in_path, :notice => "Signed up!"
  	else
    	render "new"
  	end
	end

	def edit
		@user = User.find(params[:id])
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|

			if @user.update_attributes(params[:user])
				format.html { redirect_to edit_user_path, notice: "Email changed" }
				format.js {}
			else
				format.html { render action: "edit" }
		# 	flash[:succsses] = "Edit user"
		# 	redirect_to edit_user_path
		# else
		# 	render "edit"
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		if @user.destroy
      redirect_to users_path, notice: "User deleted."
    end
	end

end
