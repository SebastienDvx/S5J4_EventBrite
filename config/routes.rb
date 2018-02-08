Rails.application.routes.draw do

#   -- static_pages --

  root 'static_pages#home'

  get 'static_pages/home'

  #    -- Sessions --

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  #    -- Users --

  resources :users

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # get '/user', to: 'users#show'


#   - Events -

  resources :events

  get '/new-event', to: 'events#new'
  post '/new-event', to: 'events#create'
  get '/all-events', to: 'events#index'


end
