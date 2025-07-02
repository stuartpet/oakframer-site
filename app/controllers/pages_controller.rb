class PagesController < ApplicationController
  def index
    render layout: "application"
  end

  def services
  end

  def privacy
    render layout: "application"
  end

  def home
    SiteVisit.log_visit(request.referer)
  end

  def restoration; end

  def oak_buildings; end
end
