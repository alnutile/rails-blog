class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :https_redirect
  before_filter :set_headers

  def set_headers
    response.headers['X-XSS-Protection'] = "0"
  end
  
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

	private

	def https_redirect
	  if ENV["ENABLE_HTTPS"] == "yes"
	    if request.ssl? && !use_https? || !request.ssl? && use_https?
	      protocol = request.ssl? ? "http" : "https"
	      flash.keep
	      redirect_to protocol: "#{protocol}://", status: :moved_permanently
	    end
	  end
	end

	def use_https?
	  true # Override in other controllers
	end

end
