Rails.application.routes.draw do

  get 'files/index'

  root to:'static_pages#home'

  get '/about', to:'static_pages#about'
  get '/news', to:'static_pages#news'
  
  get '/create', to:'static_pages#create'
 
  get '/signup',  to: 'users#new'
  get '/signup',  to: 'users#home'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations,only: [:edit]
  resources :beforeposts,          only: [:create, :destroy,:edit,:update]
  resources :files
  
  get '/before', to: 'beforeposts#before'
  get '/show', to: 'beforeposts#show'
end
