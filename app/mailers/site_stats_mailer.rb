# app/mailers/site_stats_mailer.rb
class SiteStatsMailer < ApplicationMailer
  require 'csv'

  def monthly_report
    @visits = SiteVisit.where(created_at: 1.month.ago..)

    csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[Referrer UserAgent IPHash Timestamp]
      @visits.find_each do |visit|
        csv << [visit.referrer, visit.user_agent, visit.ip_hash, visit.created_at]
      end
    end

    attachments["site_visits_#{Time.zone.now.strftime('%Y-%m')}.csv"] = {
      mime_type: 'text/csv',
      content: csv_data
    }

    mail(
      to: ENV.fetch("CONTACT_EMAIL", "example@example.com"),
      subject: I18n.t('site_visits.subject')
    )
  end
end
