# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ActivitiesController', type: :request do
  let(:user) { create(:user) }

  describe 'GET' do
    context 'when index' do
      it 'returns all activities' do
        create_list(:activity, 10, creator: user)
        get '/api/activities', headers: { Authorization: "Token #{user.token}" }
        expect(response).to have_http_status :ok
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(10)
      end
    end

    context 'when show' do
      let(:activity) { create(:activity, creator: user) }

      before { get "/api/activities/#{activity.id}", headers: { Authorization: "Token #{user.token}" } }

      it 'returns the activity' do
        expect(response).to have_http_status :ok
        body = JSON.parse(response.body)
        expect(body['data']['id']).to eq activity.id
      end
    end
  end

  describe 'POST' do
    it 'returns 200' do
      post '/api/activities',
           params: { data: attributes_for(:activity).as_json.merge(creator_id: user.id) },
           headers: { Authorization: "Token #{user.token}" }
      expect(response).to have_http_status :ok
    end
  end

  describe 'PUT' do
    let(:activity) { create(:activity, creator: user) }

    before do
      put "/api/activities/#{activity.id}",
          params: { data: { title: 'Test' } }, headers: { Authorization: "Token #{user.token}" }
    end

    it 'returns 200' do
      expect(response).to have_http_status :ok
      body = JSON.parse(response.body)
      expect(body['data']['title']).to eq 'Test'
    end
  end

  describe 'DELETE' do
    let!(:activity) { create(:activity, creator: user) }

    it 'returns 200' do
      expect do
        delete "/api/activities/#{activity.id}", headers: { Authorization: "Token #{user.token}" }
      end.to change(Activity, :count).by(-1)
    end
  end
end
