Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    

  
    member do
      get :followings
      get :followers
      
  #===add_start===
  
      get :favoritings
  
  #===add_end===
      
    end
  end

  resources :microtasks, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  ##===add_start===
  
  # resources :favorites, only: [:index, :show, :new, :create]
  resources :favorites, only: [:create, :destroy]
  
  ##===add_end===
  
  #===add_start===
  
  # resources :favorelationships, only: [:create, :destroy]
  
  #===add_end===
end