class ApplicationController < ActionController::API
	before_action :authorize_request

	def authorize_request
		raise NotImplementedError
	end

end
