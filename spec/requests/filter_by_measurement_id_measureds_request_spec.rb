# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'FilterByMeasurementIdMeasureds', type: :request do
  let!(:user) { create(:user) }
  let!(:measurement) { create(:measurement) }
  let!(:measureds) { create_list(:measured, 10, user_id: user.id, measurement_id: measurement.id) }
  let(:user_id) { user.id }
  let(:measurement_id) { measurement.id }
  let(:id) { measureds.first.id }

  before :each do
    FilterByMeasurementIdMeasuredsController.skip_before_action :require_login
  end
  after :each do
    FilterByMeasurementIdMeasuredsController.before_action :require_login
  end

  # Test suite for GET /users/filter_by_measurement_id_measureds
  describe 'GET /users/:user_id/filter_by_measurement_id_measureds' do
    # make HTTP get request before each example
    before { get "/users/#{user_id}/filter_by_measurement_id_measureds" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
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

  # Test suite for GET /users/:user_id/filter_by_measurement_id_measureds/:id
  describe 'GET /users/:user_id/filter_by_measurement_id_measureds/:id' do
    before { get "/users/#{user_id}/filter_by_measurement_id_measureds/#{id}" }

    context 'when the user measured exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
