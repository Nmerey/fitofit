class ActivitiesController < ApplicationController
	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
	end


	private

	def activity_params

		params.require(:activity).permit!
		
	end
end
