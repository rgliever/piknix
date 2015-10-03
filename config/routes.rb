Rails.application.routes.draw do
  root                 'posts#index'
  get 'signup'      => 'users#new'
  get 'login'       => 'sessions#new'
  post 'login'      => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'tags',      to: 'posts#index', as: :search
  resources :users
  resources :posts
end
