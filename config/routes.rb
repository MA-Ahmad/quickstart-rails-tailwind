Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users, only: :show
end
