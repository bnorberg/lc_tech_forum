class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end
  
  def authorize_post
    unless current_user.username == Post.find(params[:id]).author
      flash[:notice] = "You cannot edit other's posts"
      redirect_back_or_to root_url
      false
    end
  end
  
  def authorize_comment
    unless current_user.username == Comment.find(params[:id]).author
      flash[:notice] = "You cannot edit other's comments"
      redirect_back_or_to root_url
      false
    end
  end
end
