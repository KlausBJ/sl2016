class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'csv'
	protect_from_forgery with: :exception
	before_action :authenticate
	
	private
		def authenticate
			if @username.nil? do 
				authenticate_or_request_with_http_basic('Administration') do |username, password| 
					if (username == 'admin' && password == 'skumh3st') || (username == 'checkin' && password == 'sL2O16') || (username == 'upload' && password == 'W1ngM4n')
						@username = username
						return true
					else
						return false
					end
				end
			end
			else
				return true
			end
		end

end
