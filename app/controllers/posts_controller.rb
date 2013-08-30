class PostsController < ApplicationController
  caches_page :index, :show
  caches_action :edit
  before_filter(only: [:index, :show]) { @page_caching = true }
  cache_sweeper :post_sweeper
  before_filter :signed_in_user, only: [:edit, :update, :new]
  respond_to :json

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all(:order => "id DESC")
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @posts }
      end
    end
  end

  def show
    @posts = Post.all(:order => "id DESC")
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @post.to_json(:include => :tag_list_json) } 
    end
  end
  
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(params[:post]);
    if @post.save
      redirect_to @post, notice: "Created Post."
    else
      render :new
    end
  end

  def update
    #respond_with Post.update(params[:id], params[:entry])
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: "Updated article."
    else
      render :edit
    end
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end	

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

  def use_https?
    false
  end

end
