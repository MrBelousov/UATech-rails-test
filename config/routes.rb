Rails.application.routes.draw do
  # User authorization
  devise_for :users

  # Resources
  resources :users

  # Root path
  root to: 'home#index'
end
