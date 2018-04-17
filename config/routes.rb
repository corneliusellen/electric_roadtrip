Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
  get '/comparision', to: 'comparision#new', as: 'new_comparision'
  get '/new_search', to: 'search#new'
  get '/search', to: 'search#index'
  resources :vehicles, except: [:new]

  namespace :api do
    namespace :v1 do
      get '/years', to: 'years#index'
      get '/makes', to: 'makes#index'
      get '/models', to: 'models#index'
      get '/options', to: 'options#index'
    end
  end
end
