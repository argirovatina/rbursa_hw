Rails.application.routes.draw do

  #get 'welcome/index'

  resources :users
  resources :petitions
  resources :sessions

  root 'welcomes#index'

  #get 'users#index'
  #post 'users#create'
  #get 'users#new'

  get 'petitions#index'
  #post 'petitions#create'
  get 'petitions#new'

end
