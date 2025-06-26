# spec/models/contact_spec.rb
require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is valid with name, email, and message' do
    contact = described_class.new(name: 'John', email: 'john@example.com', subject: 'contact request', message: 'Hi')
    expect(contact).to be_valid
  end

  it 'is invalid without a name' do
    contact = described_class.new(name: '', email: 'john@example.com', subject: '', message: 'Hi')
    expect(contact).not_to be_valid
  end
end
