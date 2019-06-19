# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParticipationsController, type: :request do
  let(:user) { create(:user) }

  describe 'GET #index' do
    let(:activity) { create(:activity, creator: user) }
    let(:participations) { create_list(:participation, 10, activity: activity) }
    subject(:request) { get '/api/activities', headers: { Authorization: "Token #{user.token}" } }

    before do

    end

      it '' do
        expect(response).to have_http_status :ok
        body = JSON.parse(response.body)
        expect(body['data'].size).to eq(10)
      end
    end

    context 'when show' do
      let(:participation) { create(:participation, creator: user) }

      before { get "/api/activities/#{participation.id}", headers: { Authorization: "Token #{user.token}" } }

      it 'returns the participation' do
        expect(response).to have_http_status :ok
        body = JSON.parse(response.body)
        expect(body['data']['id']).to eq participation.id
      end
    end
  end

  describe 'POST' do
    it 'returns 200' do
      post '/api/activities',
           params: { data: attributes_for(:participation).as_json.merge(creator_id: user.id) },
           headers: { Authorization: "Token #{user.token}" }
      expect(response).to have_http_status :ok
    end
  end

  describe 'PUT' do
    let(:participation) { create(:participation, creator: user) }

    before do
      put "/api/activities/#{participation.id}",
          params: { data: { title: 'Test' } }, headers: { Authorization: "Token #{user.token}" }
    end

    it 'returns 200' do
      expect(response).to have_http_status :ok
      body = JSON.parse(response.body)
      expect(body['data']['title']).to eq 'Test'
    end
  end

  describe 'DELETE' do
    let!(:participation) { create(:participation, creator: user) }

    it 'returns 200' do
      expect do
        delete "/api/activities/#{participation.id}", headers: { Authorization: "Token #{user.token}" }
      end.to change(Participation, :count).by(-1)
    end
  end
end
