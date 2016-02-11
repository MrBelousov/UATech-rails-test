Rails.application.routes.draw do
  # User authorization
  devise_for :users

  # Resources
  resources :users
  resources :microposts

  # Root path
  root to: 'home#index'
end
