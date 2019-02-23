class UsersController < ApplicationController
	skip_before_action :require_valid_user!
	before_action :reset_session, except: [:show]

	def new
		@user = User.new
		
	end

	def show

		@user = User.find(params[:id])
		all_activities = Activity.where(user_id: @user.id)
		@last_activity = all_activities.last


		if @last_activity.nil?
			flash[:danger] = "Do not posses any Statistics so far!"
			redirect_to root_path
			
		end

		@last_week_activity = all_activities.select {|actv| actv.created_at.to_date.mjd >= (Date.today.mjd - 7)}
		@last_week_distance_sum = @last_week_activity.map {|actv| actv.distance }.compact.sum
		@last_week_average = @last_week_distance_sum / @last_week_activity.count

		@last_month_activity = all_activities.select {|actv| actv.created_at.to_date.mjd >= (Date.today.mjd - 30)}
		@last_month_average = @last_month_activity.map {|actv| actv.distance }.compact.sum / @last_month_activity.count
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] =  'You have successfully created an account.  Please sign in to continue.'
			redirect_to '/sign_in'
		else

			render :new
		end
		
	end

	private

	def user_params

		params.require(:user).permit(:email, :password, :password_confirmation)
		
	end
end
