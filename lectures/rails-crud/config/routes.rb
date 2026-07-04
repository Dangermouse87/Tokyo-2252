Rails.application.routes.draw do
  get "restaurants/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Verb, URI, controller#action, path prefix 
  # verb, "URI", to: "controller#action", as: :path_prefix

  # index -> see all
  get "restaurants", to: "restaurants#index", as: :restaurants
  # new -> create a new instance
  get "restaurants/new", to: "restaurants#new", as: :new_restaurant
  # show -> see one
  get "restaurants/:id", to: "restaurants#show", as: :restaurant
  # create
  post "restaurants", to: "restaurants#create"
  # edit
  get "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  # update
  patch "restaurants/:id", to: "restaurants#update"
  # delete / destroy
  delete "restaurants/:id", to: "restaurants#destroy"
end
