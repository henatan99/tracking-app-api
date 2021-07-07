require 'rails_helper'

RSpec.describe "Measurements", type: :request do
    # initialize test data 
    let!(:measurements) { create_list(:measurement, 5) }
    let(:measurement_id) { measurements.first.id }

    # Test suite for GET /measurements
    describe 'GET /measurements' do
        
    end 
end
