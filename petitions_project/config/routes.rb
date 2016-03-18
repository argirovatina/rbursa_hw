Rails.application.routes.draw do

  root 'petitions#index_last'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users
  resources :petitions
  resources :votes, only: :create

end
