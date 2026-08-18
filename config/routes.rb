Rails.application.routes.draw do
  # both auto-generate routes for a 'resource'
  resource :session
  resources :passwords, param: :token

  # Sign-up: manual routes since RegistrationsController only needs new/create
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  # Generate resources only whats actually needs to be built
  resources :tweets, only: [ :create, :destroy]
  resources :users, only: [ :show ]

  # is_alive? 'Heartbeat check' for URL
  get "up" => "rails/health#show", as: :rails_health_check

  # Shortcut for root URL
  root "tweets#index"

end
