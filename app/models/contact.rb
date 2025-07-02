# app/models/contact.rb
class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :message, :location, :telephone

  validates :name, :email, :message, :location, :telephone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telephone, format: {
    with: /\A[+\d]?(?:[\d\s\-().]{7,})\z/,
    message: "is not a valid phone number"
  }, allow_blank: false
end
