# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParticipationsController, type: :request do
  let(:user) { create(:user) }
  let(:activity) { create(:activity, creator: user) }

  describe 'GET #index' do
    subject(:request) { get url, headers: { Authorization: "Token #{user.token}" } }

    before { create_list(:participation, 10, activity: activity) }

    let(:url) { "/api/activities/#{activity.to_param}/participations" }

    it 'returns all participations' do
      request
      expect(response).to have_http_status :ok
      body = JSON.parse(response.body)
      expect(body['data'].size).to eq(10)
    end
  end

  describe 'POST #create' do
    subject(:request) { post url, headers: { Authorization: "Token #{user.token}" }, params: {} }

    let(:url) { "/api/activities/#{activity.to_param}/participations" }

    it 'creates a participation' do
      request
      expect(response).to have_http_status :ok
      body = JSON.parse(response.body)
      expect(body.dig('data', 'id')).not_to be_falsy
    end

    context 'when participation exists, but is canceled' do
      it 'reactivates the participation' do
        participation = create(:participation, user: user, activity: activity, canceled_at: 1.day.ago)
        request
        expect(response).to have_http_status :ok
        body = JSON.parse(response.body)
        expect(body.dig('data', 'id')).to eq(participation.id)
        expect(body.dig('data', 'canceled_at')).to be_falsy
      end
    end
  end

  describe 'GET #show' do
    subject(:request) { get url, headers: { Authorization: "Token #{user.token}" } }

    let(:participation) { create(:participation, user: user, activity: activity, canceled_at: 1.day.ago) }
    let(:url) { "/api/participations/#{participation.to_param}" }

    it 'shows a participation' do
      request
      expect(response).to have_http_status :ok
      data = JSON.parse(response.body)['data']
      expect(data['id']).to eq(participation.id)
      expect(data['user_id']).to eq(participation.user_id)
      expect(data['activity_id']).to eq(participation.activity_id)
      expect(data['canceled_at']).to be_truthy
    end
  end

  describe 'DELETE #delete' do
    subject(:request) { delete url, headers: { Authorization: "Token #{user.token}" } }

    let(:participation) { create(:participation, user: user, activity: activity) }
    let(:url) { "/api/participations/#{participation.to_param}" }

    it 'deletes a participation' do
      request
      expect(response).to have_http_status :ok
      participation.reload
      expect(participation).to be_canceled
    end
  end
end
