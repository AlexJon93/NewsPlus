Rails.application.routes.draw do
  root      'posts#index'
  get       '/login',               to: 'sessions#new'
  post      '/login',               to: 'sessions#create'
  get       '/signup',              to: 'users#new'
  post      '/signup',              to: 'users#create'
  delete    '/logout',              to: 'sessions#destroy'
  get       '/update_home',         to: 'posts#update_home'

  get       '/users/:id/posts',     to: 'users#posts',        as: 'user_posts'
  get       '/users/:id/comments',  to: 'users#comments',     as: 'user_comments'
  get       '/users/:id/replies',   to: 'users#replies',      as: 'user_replies'
  post      '/:id/image',           to: 'users#upload_image', as: 'user_image'

  resources :users, only: [:create, :show, :edit, :update]
  resources :posts do
    resources :comments, only: [:create]
  end
end
