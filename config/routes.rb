Rails.application.routes.draw do
  root to: 'home#index'

  get '/signup', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users
end
