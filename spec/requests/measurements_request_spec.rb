# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  # initialize test data
  let!(:measurements) { create_list(:measurement, 10) }
  let(:id) { measurements.first.id }

   before :each do 
    MeasurementsController.skip_before_action :require_login
   end 
    after :each do
        MeasurementsController.before_action :require_login
    end

  # Test suite for GET /measurements
  describe 'GET /measurements' do
    # make HTTP get request before each example
    before { get '/measurements' }

    it 'returns measurements' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /measurements/:id
  describe 'GET /measurements/:id' do
    before { get "/measurements/#{id}" }

    context 'when the record exists' do
      it 'returns the measurement' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Measurement with 'id'=100\"}")
      end
    end
  end

  # Test suite for POST /measurements
  describe 'POST /measurements' do
    # valid payload
    let(:valid_attributes) { { name: 'blood pressure', unit: 'psi' } }

    context 'when the request is valid' do
      before { post '/measurements', params: valid_attributes }

      it 'creates a measurement' do
        expect(json['name']).to eq('blood pressure')
        expect(json['unit']).to eq('psi')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/measurements', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Name can't be blank, Unit can't be blank\"}")
      end
    end
  end

  # Test suite for PUT /measurements/:id

  describe 'PUT /measurements/:id' do
    let(:valid_attributes) { { name: 'heart beat', unit: '/min' } }

    context 'when the record exists' do
      before { put "/measurements/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /measurements/:id
  describe 'DELETE /measurements/:id' do
    before { delete "/measurements/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
