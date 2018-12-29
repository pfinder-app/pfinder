require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  let(:user) { create(:user) }
  before { allow(controller).to receive(:current_user) { user } }

  describe 'GET' do
    context 'index' do
      let!(:users) { create_list(:user, 10) }

      before { get '/api/users' }

      it 'returns correct users' do
        expect(response).to have_http_status 200
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq 10
      end
    end

    context 'show' do
      let!(:user) { create(:user) }

      before { get "/api/users/#{user.id}" }

      it 'returns correct user' do
        expect(response).to have_http_status 200
        body = JSON.parse(response.body)
        expect(body['data']['id']).to eq user.id
      end
    end
  end

  describe 'POST' do
    it 'returns 200' do
      post '/api/users',
           params: { data: attributes_for(:user).as_json }

      expect(response).to have_http_status 200
    end
  end

  describe 'PUT' do
    let!(:user) { create(:user, name: 'Name') }

    before do
      put "/api/users/#{user.id}",
          params: { data: { name: 'Name 2' } }
    end

    it 'returns 200' do
      expect(response).to have_http_status 200
      body = JSON.parse(response.body)
      expect(body['data']['name']).to eq 'Name 2'
    end
  end

  describe 'DELETE' do
    let!(:user) { create(:user) }

    it 'returns 200' do
      expect do
        delete "/api/users/#{user.id}"
      end.to change(User, :count).by(-1)
    end
  end
end
