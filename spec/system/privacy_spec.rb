require 'rails_helper'

RSpec.describe 'Privacy Page', type: :request do
  it 'returns a successful response and includes expected content' do
    get privacy_path

    aggregate_failures do
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Privacy Policy')
      expect(response.body).to include('does not store personal information')
    end
  end
end
