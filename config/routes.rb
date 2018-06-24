Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout

  get '/oauth/callback', to: 'oauths#callback'
  post '/oauth/callback', to: 'oauths#callback'
  get '/oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  get '/signup', to: 'users#new', as: :new_user
  post '/registration', to: 'users#create', as: :users

  get '/original_songs', to: 'original_songs#index'
  get '/original_songs/:original_short_title/:original_song_title', to: 'original_songs#show', as: :original_song, original_song_title: %r{[^\/]+}

  get '/events', to: 'events#index'
  post '/events', to: 'events#create'
  get '/events/new', to: 'events#new'
  get '/events/series/:series_title', to: 'events/series#show', as: 'events_series', series_title: %r{[^\/]+}
  get '/events/series/:series_title/:title', to: 'events#show', as: 'events_series_show', series_title: %r{[^\/]+}, title: %r{[^\/]+}
  get '/events/series/:series_title/:title/:days', to: 'events#show', as: 'events_series_days_show', series_title: %r{[^\/]+}, title: %r{[^\/]+}
  get '/events/date/:year', to: 'events/date#show', as: 'events_date', year: /\d{4}/
  get '/events/date/:year/:title', to: 'events#show', as: 'events_date_show', year: /\d{4}/, title: %r{[^\/]+}
  get '/events/date/:year/:title/:days', to: 'events#show', as: 'events_date_days_show', year: /\d{4}/, title: %r{[^\/]+}

  resources :circles, only: %i[index new create show], param: :name, name: %r{[^\/]+} do
    resources :discographies, only: %i[index show], module: 'circles', param: :title, title: %r{[^\/]+}
    resources :songs, only: %i[index], module: 'circles'
    resources :statistics, only: %i[index], module: 'circles'
  end
  resources :artists, only: %i[index show], param: :name, name: %r{[^\/]+}
  resources :vocalists, only: %i[index show], param: :name, name: %r{[^\/]+}
  resources :arrangers, only: %i[index show], param: :name, name: %r{[^\/]+}
  resources :lyricists, only: %i[index show], param: :name, name: %r{[^\/]+}

  namespace :api, { format: :json } do
    namespace :v1 do
      resources :artists, only: %i[index]
      resources :circles, only: %i[index]
      resources :vocalists, only: %i[index]
      resources :arrangers, only: %i[index]
      resources :lyricists, only: %i[index]
      resources :originals_count, only: %i[index]
    end
  end

  namespace :admin do
    resources :arrangers
    resources :artists
    resources :authentications
    resources :circles
    resources :composers
    resources :discographies
    resources :events
    resources :event_series
    resources :lyricists
    resources :originals
    resources :original_songs
    resources :rearrangers
    resources :songs
    resources :song_arrangers
    resources :song_composers
    resources :song_lyricists
    resources :song_original_songs
    resources :song_rearrangers
    resources :song_vocalists
    resources :users
    resources :vocalists

    root to: "arrangers#index"
  end
end
