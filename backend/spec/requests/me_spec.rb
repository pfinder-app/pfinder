require 'rails_helper'

RSpec.describe 'MeController', type: :request do

  describe 'GET' do
    context 'index' do
      it_behaves_like 'an unauthorized request' do
        before { get('/api/me') }
      end
      it_behaves_like 'an authorized request' do
        let!(:user) { create(:user) }
        before do
          get('/api/me', headers: { Authorization:  "Token #{user.token}"})
        end
      end

      # before { get '/api/me' }

      # context 'with correct token' do
      #   it 'returns correct user' do
      #     expect(response).to have_http_status :ok
      #     body = JSON.parse(response.body)
      #     expect(body['data']['id']).to eq user.id
      #   end
      # end

      # context 'without token' do
      #   it 'returns correct users' do
      #     expect(response).to have_http_status :unauthorized
      #   end
      end
    end

  # describe 'POST' do
  #   it 'returns 200' do
  #     post '/api/users',
  #          params: { data: attributes_for(:user).as_json }

  #     expect(response).to have_http_status 200
  #   end
  # end

  # describe 'PUT' do
  #   let!(:user) { create(:user, name: 'Name') }

  #   before do
  #     put "/api/users/#{user.id}",
  #         params: { data: { name: 'Name 2' } }
  #   end

  #   it 'returns 200' do
  #     expect(response).to have_http_status 200
  #     body = JSON.parse(response.body)
  #     expect(body['data']['name']).to eq 'Name 2'
  #   end
  # end
end
