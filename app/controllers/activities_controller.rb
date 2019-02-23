class ActivitiesController < ApplicationController
	skip_before_action :require_valid_user!
	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)
		@activity.user_id = session[:user_id]
		start_point = Geocoder.coordinates(activity_params[:start_point])
		end_point = Geocoder.coordinates(activity_params[:end_point])
		@activity.distance = Geocoder::Calculations.distance_between(start_point,end_point,units: :km)


		if @activity.save
			flash[:success] =  'You have added Activity'
			redirect_to user_path(session[:user_id]) #returns to page of user
		else

			render :new
		end
	end

	def index
		all_activities = Activity.where(user_id: params[:user_id])
		@last_month_activities= all_activities.select {|actv| actv.created_at.to_date.mjd >= (Date.today.mjd - 30)}
		
	end


	private

	def activity_params

		params.require(:activity).permit(:start_point,:end_point,:user_id)
		
	end
end
