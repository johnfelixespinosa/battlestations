Rails.application.routes.draw do
  
  devise_for :users

  # get 'battlestations' => 'battlestations#index', as: :battlestations

  root to: 'static_pages#home'

  resources :battlestations

  resources :users do 
    resources :battlestations, only: [:show, :index, :new,]
  end
end