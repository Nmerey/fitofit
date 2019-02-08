require 'rails_helper'

RSpec.describe 'Sessions', type: :request do

	let!(:user) {create(:user)}

	describe 'GET /sign_in' do

		before { get '/sign_in'}

		context 'If not signed in ' do

			it 'should return sign in page' do

				expect(response).to have_http_status(200)

			end
		end

		context 'If signed in' do

			before { session[:user_id] = user.id}

			it 'should redirect to users page' do

				expect(response).to redirect_to(user_path(user.id))
			end
		end


	end

	describe 'GET /sign_out' do

		before {get '/sign_out'}

		it 'should destroy session and goes to login page' do

			expect(session[user_id]).to eq nil
			expect(response).to redirect_to('/sign_in')


		end	
	end

end
