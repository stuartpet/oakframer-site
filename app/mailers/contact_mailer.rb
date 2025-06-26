class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name = name
    @message = message
    mail(
      to: ENV.fetch("CONTACT_EMAIL", "your-email@example.com"),
      from: ENV.fetch("SMTP_FROM"),
      subject: "New contact from #{ENV.fetch("SITE_NAME")}"
    )
  end
end
