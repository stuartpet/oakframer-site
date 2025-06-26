require 'rails_helper'

RSpec.describe "SiteVisits", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/site_visits/index"
      expect(response).to have_http_status(:success)
    end
  end
end
