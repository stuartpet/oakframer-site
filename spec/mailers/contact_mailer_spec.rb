# require 'rails_helper'
#
# RSpec.describe ContactMailer, type: :mailer do
#   describe 'contact_email' do
#     let(:contact) do
#       Contact.new(name: 'Jane', email: 'jane@example.com', subject: 'New contact from Jane', message: 'Hello there')
#     end
#
#     let(:mail) { described_class.contact_email(contact) }
#
#     it 'renders the subject' do
#       expect(mail.subject).to eq('New contact from Jane')
#     end
#
#     it 'sends to the configured email' do
#       expect(mail.to).to eq([ENV.fetch('CONTACT_EMAIL', 'hello@example.com')])
#     end
#
#     it 'includes the name and message in the body' do
#       expect(mail.body.encoded).to include('Jane')
#       expect(mail.body.encoded).to include('Hello there')
#     end
#   end
# end
