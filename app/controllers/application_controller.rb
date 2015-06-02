class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_user
  	session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def authenticate_user!
  	redirect_to login_path unless current_user       #to authenticate current user before they do anything to the account
  end
end
