Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout

  get '/signup', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users
end
