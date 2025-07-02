class SiteVisitsController < ApplicationController
  def index
    raw_data = SiteVisit.load_data

    @site_visits = raw_data
                     .sort_by { |visit| Time.parse(visit["timestamp"]) }
                     .reverse
                     .first(50)
  end
end
