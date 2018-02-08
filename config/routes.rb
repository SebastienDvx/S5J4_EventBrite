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

#   - Events -

  resources :events

  get 'events/:id/participe/', to: 'events#participe'
  get 'events/:id/unfollow', to: 'events#unfollow'
  # get 'events/:id/attendees/', to: 'events#showattendees', as: 'attendees'
  get '/new-event', to: 'events#new'
  post '/new-event', to: 'events#create'
  get '/all-events', to: 'events#index'

end
