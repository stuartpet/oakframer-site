require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("About")
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get contact_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Contact")
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get about_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("About")
    end
  end

  describe "GET /privacy" do
    it "returns http success" do
      get privacy_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Privacy")
    end
  end
end
