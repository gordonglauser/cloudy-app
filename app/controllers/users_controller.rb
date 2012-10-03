class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration is finished!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      render :action => 'edit'
    else
      flash[:notice] = "Problem editing your user."
      render :action => 'edit'
    end
  end
end
