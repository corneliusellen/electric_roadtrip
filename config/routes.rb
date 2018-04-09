Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
  get '/comparision', to: 'comparision#new', as: 'new_comparision'
  resources :vehicles, except: [:new]
  get '/new_search', to: 'search#new'
  get '/search', to: 'search#index'
end
