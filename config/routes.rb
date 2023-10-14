Rails.application.routes.draw do
  devise_for :users
  resources :rooms
  resources :posts
  root 'posts#index'
  resources :users
  resources :users, only: [:show]
end