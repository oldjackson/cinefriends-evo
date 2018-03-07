Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'

  resources :movies
  # get '/movies/:id/postings', to: 'movies#postings', as: 'show_postings'

  resources :postings do
    resources :pairings, only: [:create]
  end

end
