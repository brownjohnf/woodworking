class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @title = 'View Users'
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to action: 'index', notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
