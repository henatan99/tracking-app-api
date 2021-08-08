# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Goals', type: :request do
  let!(:user) { create(:user) }
  let!(:measurement) { create(:measurement) }
  let!(:goals) { create_list(:goal, 1, user_id: user.id, measurement_id: measurement.id) }
  let(:user_id) { user.id }
  let(:measurement_id) { measurement.id }
  let(:id) { goals.first.id }

  before :each do
    GoalsController.skip_before_action :require_login
  end
  after :each do
    GoalsController.before_action :require_login
  end

  # Test suite for GET /measureds
  describe 'GET /users/:user_id/goals' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}/goals" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user goals' do
        # Note 'json' is a custom helper to parse JSON responses
        expect(json).not_to be_empty
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find User with 'id'=100\"}")
      end
    end
  end

  # Test suite for GET /users/:user_id/measureds/:id
  describe 'GET /users/:user_id/goals/:id' do
    before { get "/users/#{user_id}/goals/#{id}" }

    context 'when the user goal exists' do
      it 'returns the goal' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
