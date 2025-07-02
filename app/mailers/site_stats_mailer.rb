# app/mailers/site_stats_mailer.rb
class SiteStatsMailer < ApplicationMailer
  require 'csv'

  def monthly_report
    visits = SiteVisit.load_data.select do |visit|
      Time.parse(visit["timestamp"]) >= 1.month.ago
    end

    csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[Referrer UserAgent IPHash Timestamp]
      visits.each do |visit|
        csv << [
          visit["referrer"] || "N/A",
          visit["user_agent"] || "N/A",
          visit["ip_hash"] || "N/A",
          visit["timestamp"]
        ]
      end
    end

    attachments["site_visits_#{Time.zone.now.strftime('%Y-%m')}.csv"] = {
      mime_type: 'text/csv',
      content: csv_data
    }

    mail(
      to: ENV.fetch("CONTACT_EMAIL", "example@example.com"),
      subject: "Monthly Site Visit Report"
    )
  end
end

