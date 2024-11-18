Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/play', to: 'static_pages#play'

  get '/signup', to: 'users#new'
  get 'users/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :games

  post '/play_game', to: 'games#play'
end
