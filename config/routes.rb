Rails.application.routes.draw do


  get 'post/new', to: 'posts#new'
  post 'post/new', to: 'posts#create'
  get '/post', to: 'post#show'
  get 'posts', to: 'posts#index'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'users#show'
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'profile', to: 'users#show'
  get 'profile/edit', to: 'users#edit'
  post 'profile/edit', to: 'users#update'
  delete 'profile/delete', to: 'users#destroy'

  resources :users
  resources :posts
  resources :sessions
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
