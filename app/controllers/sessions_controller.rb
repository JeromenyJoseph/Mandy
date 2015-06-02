class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user and @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to @user, notice: "Successfully logged in!"
  	else
  		flash[:alert] = "There was a problem. Please try again."
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out."
  end

end
