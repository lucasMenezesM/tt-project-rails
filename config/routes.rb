Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "main" => "main#index", as: "main"

  get "users/signup" => "users#new", as: "signup"
  post "users" => "users#create"

  get "signin" => "sessions#new", as: "signin"
  post "signin" => "sessions#create", as: "signin_create"

  delete "logout" => "sessions#destroy", as: "logout"

  # Defines the root path route ("/")
  # root "posts#index"
end
