class WoodsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /woods
  # GET /woods.json
  def index
    @woods = Wood.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @woods }
    end
  end

  # GET /woods/1
  # GET /woods/1.json
  def show
    @wood = Wood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wood }
    end
  end

  # GET /woods/new
  # GET /woods/new.json
  def new
    @wood = Wood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wood }
    end
  end

  # GET /woods/1/edit
  def edit
    @wood = Wood.find(params[:id])
  end

  # POST /woods
  # POST /woods.json
  def create
    @wood = Wood.new(params[:wood])

    respond_to do |format|
      if @wood.save
        format.html { redirect_to @wood, notice: 'Wood was successfully created.' }
        format.json { render json: @wood, status: :created, location: @wood }
      else
        format.html { render action: "new" }
        format.json { render json: @wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /woods/1
  # PUT /woods/1.json
  def update
    @wood = Wood.find(params[:id])

    respond_to do |format|
      if @wood.update_attributes(params[:wood])
        format.html { redirect_to @wood, notice: 'Wood was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /woods/1
  # DELETE /woods/1.json
  def destroy
    @wood = Wood.find(params[:id])
    @wood.destroy

    respond_to do |format|
      format.html { redirect_to woods_url }
      format.json { head :no_content }
    end
  end
end
