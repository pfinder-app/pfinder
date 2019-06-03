# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ActivitiesController', type: :request do
  let(:user) { create(:user) }

  describe 'GET' do
    context 'index' do
      let!(:activities) { create_list(:activity, 10, creator: user) }
      before { get "/api/activities", headers: {} }

    
      it 'returns all activities' do
        expect(response).to have_http_status 200
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(10)
      end
    end

    context 'show' do
      let(:activity) { create(:activity, creator: user) }

      before { get "/api/activities/#{activity.id}", headers: {} }


      it 'returns the activity' do
        expect(response).to have_http_status 200
        body = JSON.parse(response.body)
        expect(body['data']['id']).to eq activity.id
      end
    end
  end

  describe 'POST' do
    it 'returns 200' do
      post "/api/activities",
           params: { data: attributes_for(:activity).as_json }

      expect(response).to have_http_status 200
    end
  end

  describe 'PUT' do
    let(:activity) { create(:activity, creator: user) }

    before do
      put "/api/activities/#{activity.id}",
          params: { data: { title: 'Test' } }
    end

    it 'returns 200' do
      expect(response).to have_http_status 200
      body = JSON.parse(response.body)
      expect(body['data']['title']).to eq 'Test'
    end
  end

  describe 'DELETE' do
    let!(:activity) { create(:activity, creator: user) }

    it 'returns 200' do
      expect do
        delete "/api/activities/#{activity.id}"
      end.to change(Activity, :count).by(-1)
    end
  end
end
