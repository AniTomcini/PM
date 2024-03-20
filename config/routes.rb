Rails.application.routes.draw do
  root "pages#home"
  resources :playlists
  resources :devices
  resources :videos
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/search', to: 'search#index', as: 'search'
end
