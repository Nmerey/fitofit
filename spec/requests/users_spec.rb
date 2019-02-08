require 'rails_helper'

RSpec.describe 'Users API', type: :request do

	describe 'POST user/new' do

		let(:user) {create(:user)}

		context 'when params are valid' do

			before {post '/users/new', params: user}

			it 'should be valid and pass' do

				expect(response).to have_http_request(201)
			end
		end

		context 'when params not valid' do

			before {post '/users/new', params: {email: '',password_digest: ''}}

			it 'returns status 422' do
				expect(response).to have_http_request(422)
			end

		end

	end

	describe 'DELETE /users/:id' do

		before { delete "/users/#{user.id}" }

		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end
	end
end
