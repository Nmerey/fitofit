class UsersController < ApplicationController
	skip_before_action :require_valid_user!
	before_action :reset_session, except: [:show]

	def new
		@user = User.new
		
	end

	def show

		@user = User.find(params[:id])
		@last_activity = Activity.where(user_id: @user.id).last
		@last_week_activity = Activity.select {|actv| actv.created_at.mjd >= (Date.today.mjd - 7)}
		
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
