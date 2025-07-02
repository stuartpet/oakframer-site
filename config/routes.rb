Rails.application.routes.draw do
  # Site usage + admin
  get "projects/index"
  get "site_visits/index"

  # Public site pages
  root to: "pages#index"
  get "oak_buildings", to: "pages#oak_buildings"
  get "restoration", to: "pages#restoration"
  get "projects", to: "pages#projects"

  # Contact form
  get "/contact", to: "contacts#new", as: :contact
  post "/contact", to: "contacts#create"
  get "/contacts", to: redirect("/contact")

  # Privacy
  get "privacy", to: "pages#privacy", as: :privacy

  # System routes
  get "up", to: "rails/health#show", as: :rails_health_check
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
