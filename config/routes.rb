Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # User authorization
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Resources
  resources :users
  resources :microposts

  # Root path
  root to: 'home#index'
end
