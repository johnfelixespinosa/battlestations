Rails.application.routes.draw do
  
  devise_for :users

  resources :battlestations

  root to: 'static_pages#home'

  resources :users do 
    resources :battlestations
  end

end
