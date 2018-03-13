Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'

  resources :users
  resources :postings, only: [:destroy] do
    resources :pairings, only: [:create]
  end
  resources :pairings, only: [:show] do
    resources :messages, only: [:create]
  end

  get "/pairings/:id/accept", to: 'pairings#accept', as: 'accept'
  get "/pairings/:id/decline", to: 'pairings#decline', as: 'decline'

  resources :movies

  resources :shows, only: [] do
    resources :postings, only: [:create]
  end

  get "/dashboard", to: 'users#dashboard'

end
