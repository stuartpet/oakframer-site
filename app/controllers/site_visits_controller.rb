# site_visit_controller.rb
class SiteVisitsController < ApplicationController
  def index
    @site_visits = SiteVisit.order(created_at: :desc).limit(50)
  end
end
