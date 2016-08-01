Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
