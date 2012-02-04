class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @title = 'All users'
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

end