class ActivitiesController < ApplicationController
	skip_before_action :require_valid_user!
	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		@activity.user_id = session[:user_id]


		if @activity.save
			flash[:success] =  'You have added Activity'
			redirect_to user_path(session[:user_id]) #returns to page of user
		else

			render :new
		end
	end


	private

	def activity_params

		params.require(:activity).permit(:start_point,:end_point,:user_id)
		
	end
end
