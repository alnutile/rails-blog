class ContentController < ApplicationController
  caches_page :about, :home
  before_filter { @page_caching = true }
  cache_sweeper :content_sweeper

  respond_to :html

  def index
  end

  def show
  	respond_with Page.find(params[:id])
  end
private

  def use_https?
    false
  end

end
