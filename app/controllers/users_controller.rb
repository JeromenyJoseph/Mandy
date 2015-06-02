class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :close]


  def new
  	@user = User.new
  end

  def edit
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to @user, notice: "New account created"    #@user = user_path(@user_id)
  	else
  		render :new
  	end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile Updated'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user.password == params[:user][:password]
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Your account has been deleted.'
    else
      flash[:alert] = "Wrong password. Having second thoughts?"
      render :close
    end
  end


  private

  def user_params 
    params.require(:user).permit(:username, :image, :email, :lname, :fname, :password, :password_confirmation)
  end



private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.




end
