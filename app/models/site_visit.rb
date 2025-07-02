# app/models/site_visit.rb
require 'json'
require 'digest'

class SiteVisit
  FILE_PATH = Rails.root.join('log', 'site_visits.json')

  def self.log_visit(referrer = nil, user_agent = nil, ip = nil)
    data = load_data

    data << {
      timestamp: Time.now.utc.iso8601,
      referrer: referrer,
      user_agent: user_agent,
      ip_hash: Digest::SHA256.hexdigest(ip.to_s)
    }

    save_data(data)
  end

  def self.load_data
    File.exist?(FILE_PATH) ? JSON.parse(File.read(FILE_PATH)) : []
  end

  def self.save_data(data)
    File.write(FILE_PATH, JSON.pretty_generate(data))
  end
end
