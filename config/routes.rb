Rails.application.routes.draw do
  
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  get 'maps/index'  
  resources :maps, only: [:index]
  get '/map_request', to: 'maps#map', as: 'map_request'
  
  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      # 当日予約客 
      get 'todays_reservations' 
    end
  end
  resources :reservations
  resources :massages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
