Rails.application.routes.draw do
  root to: redirect('/login')
  get   '/login',   to: 'sessions#new'
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  resources :users, only: [:create]
end
