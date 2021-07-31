# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'Auths', type: :request do
#   let(:user) { create(:user) }
#   let(:header) { { 'Authorization' => token_generator(user.id) } }
#   subject(:invalid_request_obj) { described_class.new({}) }
#   subject(:request_obj) { described_class.new(header) }

#   describe '#call' do
#     context 'returns user object' do
#       it 'returns user object' do
#         result = request_obj.call
#         expect(result[:user]).to eq(user)
#       end
#     end
#   end
# end
