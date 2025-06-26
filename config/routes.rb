Rails.application.routes.draw do
  get "projects/index"
  get "site_visits/index"
  # Your normal dev/staging routes
  root to: "pages#index"
  get "privacy", to: "pages#privacy", as: :privacy
  get "about", to: "pages#about", as: :about
  get 'projects', to: 'projects#index'
  get "services", to: "pages#services"

  # Contact form
  get "/contact", to: "contacts#new", as: :contact
  get "/contacts", to: redirect("/contact")
  resources :contacts, only: [:new, :create]

  # Common routes
  get "coming_soon", to: "pages#coming_soon"
  get "up", to: "rails/health#show", as: :rails_health_check
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
