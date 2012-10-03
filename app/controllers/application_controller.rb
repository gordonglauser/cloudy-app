class ApplicationController < ActionController::Base
  helper_method :current_user_session, :current_user
  
  protected
  def authenticate
    unless current_user
      flash[:notice] = "Please Log In!"
      redirect_to new_user_session_url
      return false
    end
  end
  
  protected
  def current_user_session
    @current_user_session ||= UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user ||= current_user_session && current_user_session.user
  end
end
