Rails.application.routes.draw do
  root      'posts#index'
  get       '/login',         to: 'sessions#new'
  post      '/login',         to: 'sessions#create'
  get       '/signup',        to: 'users#new'
  post      '/signup',        to: 'users#create'
  delete    '/logout',        to: 'sessions#destroy'
  get      '/update_home',   to: 'posts#update_home'
  resources :users, only: [:create]
end
