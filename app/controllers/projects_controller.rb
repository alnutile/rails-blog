class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new]
  respond_to :json

  def index
    @projects = Project.all(:order => "created_at DESC")
    @projectFull = @projects.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { 
        render json: @projects }
    end
  end

  def show
    @projectFull = Project.find(params[:id])
    @projects = Project.all(:order => "created_at DESC")
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @projectFull }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
  	@project = Project.create(params[:project]);
    if @project.save
      redirect_to @project, notice: "Created project."
    else
      render :new
    end
  end

  def new
    @project = Project.new
  end

  def update
    #respond_with Project.update(params[:id], params[:entry])
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Updated project."
    else
      render :edit
    end
  end

  def destroy
    respond_with Project.destroy(params[:id])
  end	

  private
    #@todo move this so it can be shared with posts
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

  def use_https?
    false
  end

end
