Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :users
  resources :petitions

  root 'petitions#indext'

  # root 'welcome#index'

  #get 'users#index'
  #post 'users#create'
  #get 'users#new'

  # get 'petitions#index'
  # #post 'petitions#create'
  # get 'petitions#new'

end
