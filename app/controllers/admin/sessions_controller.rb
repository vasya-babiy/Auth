class Admin::SessionsController < ApplicationController
	
def new
end

def create
  admin = Admin.authenticate_admin(params[:email], params[:password])
  if admin
    session[:admin_id] = admin.id
    redirect_to admin_admin_admin_profile_path(admin), :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:admin_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end


end
