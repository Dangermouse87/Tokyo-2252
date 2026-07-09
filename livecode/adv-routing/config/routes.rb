Rails.application.routes.draw do
  root "parks#index"
  resources :parks do
    resources :dinosaurs, only: [ :new, :create ]
  end
  resources :dinosaurs, only: [ :destroy ]
end
