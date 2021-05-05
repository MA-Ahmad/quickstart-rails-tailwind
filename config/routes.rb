Rails.application.routes.draw do
  root to: 'home#index'

  scope :page do
    get '/team', to: 'pages#team'
    get '/features', to: 'pages#features'
    get '/projects', to: 'pages#projects'
    get '/settings/account', to: 'pages#account'
  end

  devise_for :users
  resource :user, only: :update
  get :profile, to: 'users#show'
  patch 'profile/password/update', to: 'users#update_password', as: :update_password
end
