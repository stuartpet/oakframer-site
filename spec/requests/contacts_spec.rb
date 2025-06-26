require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe 'GET /contact' do
    it 'renders the contact form' do
      get contact_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Contact')
    end
  end

  describe 'GET /contacts' do
    it 'redirects to /contact' do
      get '/contacts'
      expect(response).to redirect_to('/contact')
    end
  end

  describe 'POST /contact' do
    let(:valid_params) do
      {
        name: 'Test User',
        email: 'test@example.com',
        subject: 'Enquiry',
        message: 'Hello!'
      }
    end

    it 'sends an email and redirects with flash message' do
      expect do
        post contacts_path, params: { contact: valid_params }
      end.to change { ActionMailer::Base.deliveries.count }.by(1)

      expect(flash[:notice]).to eq("Thank you for your message. We will be in touch soon.")
    end

    it 're-renders the form with errors on failure' do
      post contacts_path, params: {
        contact: { name: '', email: '', subject: '', message: '' }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("There was a problem with your submission.")
      expect(response.body).to include("class=\"field-error\"")
    end
  end
end
