require 'rails_helper'

RSpec.describe 'Auths', type: :request do
  include ApiHelper

  context 'with an authenticated user' do
    let(:user) { create(:user) }

    it 'renders json listing resource with username' do
      post '/login', params: { username: user.username }
      authenticated_header(request, user)
      expect(response).to be_successful
    end
  end
end
