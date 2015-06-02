Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, except: [:index, :edit,]
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'
  
  get '/profile/close', to: 'users#close', as: 'close_profile'

  resources :chirps
  root 'chirps#index'


end
