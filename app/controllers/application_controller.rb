class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end
end
