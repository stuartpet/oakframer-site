class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact

    mail(
      to: ENV.fetch("CONTACT_EMAIL", "your-email@example.com"),
      from: ENV.fetch("SMTP_FROM"),
      reply_to: email,
      subject: "New contact from #{ENV.fetch("SITE_NAME")}"
    )
  end
end
