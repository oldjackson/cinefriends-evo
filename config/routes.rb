Rails.application.routes.draw do

  resources :movies
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'
  resources :users
  resources :postings

end
