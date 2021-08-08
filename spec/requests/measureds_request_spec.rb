# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Measureds', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:measurement) { create(:measurement) }
  let!(:measureds) { create_list(:measured, 10, user_id: user.id, measurement_id: measurement.id) }
  let(:user_id) { user.id }
  let(:measurement_id) { measurement.id }
  let(:id) { measureds.first.id }

  before :each do
    MeasuredsController.skip_before_action :require_login
  end
  after :each do
    MeasuredsController.before_action :require_login
  end

  # Test suite for GET /measureds
  describe 'GET /users/:user_id/measureds' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}/measureds" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user measureds' do
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
  describe 'GET /users/:user_id/measureds/:id' do
    before { get "/users/#{user_id}/measureds/#{id}" }

    context 'when the user measured exists' do
      it 'returns the measured' do
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
