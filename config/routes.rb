Rails.application.routes.draw do
  resources :movies

  devise_for :users
  root to: 'pages#home'
  get '/billboard', to: 'pages#billboard', as: 'billboard'
  resources :users
  resources :postings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
