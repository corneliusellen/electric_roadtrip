Rails.application.routes.draw do
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#index'
  get '/new_search', to: 'search#new'
  get '/search', to: 'search#index'
  get '/comparision/new', to: 'comparision#new', as: 'new_comparision'
  get '/comparision', to: 'comparision#show', as: 'comparision'
  get '/route/new', to: 'route#new', as: 'new_route'
  get '/route', to: 'route#show'
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
