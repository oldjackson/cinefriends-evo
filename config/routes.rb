Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'

  resources :users
  resources :postings do
    resources :pairings, only: [:create]
  end
  resources :pairings, only: [:show] do
    resources :messages, only: [:create]
  end

  resources :movies

  get "/dashboard", to: 'users#dashboard'

end
