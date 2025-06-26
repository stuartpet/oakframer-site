# app/models/contact.rb
class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :message, :subject

  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
