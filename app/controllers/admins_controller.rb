class AdminsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, :except => [ :index ]
  
  def index
    @admins = Admin.paginate(:page => params[:id])
    @title = 'All Admins'
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])

    respond_to do |format|
      if @admin.save
        format.html { redirect_to action: 'index', notice: 'Admin was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @admin = Admin.find(params[:id])
    
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to action: 'index', notice: 'Admin was successfully updated.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }
    end
  end
  
end
