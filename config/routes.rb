Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, only: :show

  scope :page do
    get '/team', to: 'pages#team'
    get '/features', to: 'pages#features'
    get '/projects', to: 'pages#projects'
  end
end
