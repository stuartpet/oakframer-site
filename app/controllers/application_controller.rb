class ApplicationController < ActionController::Base
  before_action :log_site_visit

  private

  def log_site_visit
    return unless request.get? # only log page visits

    ip_hash = Digest::SHA256.hexdigest(request.remote_ip)

    SiteVisit.create!(
      referrer: request.referer,
      user_agent: request.user_agent,
      ip_hash: ip_hash
    )
  end

  # allow legacy browsers
  allow_browser versions: {
    safari: 15..Float::INFINITY,
    chrome: 100..Float::INFINITY,
    firefox: 100..Float::INFINITY,
    edge: 100..Float::INFINITY,
    ios_safari: 15..Float::INFINITY,
    samsung_internet: 15..Float::INFINITY
  }
end
