class ContentController < ApplicationController
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
