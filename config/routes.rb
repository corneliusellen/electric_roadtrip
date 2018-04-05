Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
  resources :vehicles
end
