# lib/tasks/monthly_report.rake
namespace :reports do
  desc "Send monthly site visit summary"
  task send_site_stats: :environment do
    SiteStatsMailer.monthly_report.deliver_now
    puts "Monthly site visit report sent."
  end
end
