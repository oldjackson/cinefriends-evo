Rails.application.routes.draw do

  resources :movies
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'
  get '/request', to: 'postings#request', as: 'request'
  resources :users
  resources :postings
  resources :messages
  resources :pairings, only: [:show] do
    resources :messages, only: [:create]
  end

end
