class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	before_filter :detect_pjax

private
	def detect_pjax
		if request.headers['X-PJAX']
			self.class.layout "pjax"
		else
			self.class.layout "application"
		end
	end
end
