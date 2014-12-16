class UsersController < ApplicationController
	
	def index
		@user = User.all
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
		if @user.update_attributes(params[:user])
			flash[:succsses] = "Edit user"
			redirect_to user_profile_path(@user)
		else
			render "edit"
		end
	end
end
