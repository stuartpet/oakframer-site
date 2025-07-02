class ApplicationController < ActionController::Base
  before_action :log_site_visit

  private

  def log_site_visit
    return unless request.get? # only log page visits

    SiteVisit.log_visit(
      request.referer,
      request.user_agent,
      request.remote_ip
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
