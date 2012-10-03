class UserSessionsController < ApplicationController
  before_filter :authenticate, :only => :destroy
  def new
    @user_session = UserSession.new
  end
  def create
    user_session = UserSession.new(params[:user_session])
      if user_session.save
      redirect_to :file_uploads
      flash[:notice] = "Successful login"
      else
      redirect_to :login
      flash[:notice] = "Enter valid information"
      end
  end
  def destroy
    current_user_session.destroy
    redirect_to :login
  end
end
