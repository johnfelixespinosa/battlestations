Rails.application.routes.draw do
  resources :battlestations
  devise_for :users
  root to: 'static_pages#home'
  resources :users

end
