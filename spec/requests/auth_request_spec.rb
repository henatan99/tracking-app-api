# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auths', type: :request do
#   let(:user) { create(:user) }
#   let(:header) { { 'Authorization' => token_generator(user.id) } }
#   subject(:invalid_request_obj) { described_class.new({}) }
#   subject(:request_obj) { described_class.new(header) }

  include ApiHelper

#   describe '#call' do
#     context 'returns user object' do
#       it 'returns user object' do
#         result = request_obj.call
#         expect(result[:user]).to eq(user)
#       end
#     end
#   end
#   context 'with an unauthenticated user' do
#     let(:user) { create(:user) }
#     it 'returns unauthorized' do
#         post "/login",  params: {username: user.username}
#       expect(response).to be_unauthorized
#     end
#   end

  context 'with an authenticated user' do
    let(:user) { create(:user) }

    it 'renders json listing resource with username' do
      post "/login",  params: {username: user.username}
      authenticated_header(request, user)
      expect(response).to be_successful
    #   expect(JSON.parse(response.body)).to eq expected_result
    end
  end
  
end
