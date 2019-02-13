class ApplicationController < ActionController::Base
	before_action :require_valid_user!

	def current_user

		if !session[:user_id].blank?
			@user ||= User.find(session[:user_id])
		end
	end

	def require_valid_user!
		
		if current_user.nil?

			redirect_to '/sign_in'
			
		end
		
	end
end
