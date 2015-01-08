Rails.application.routes.draw do
  root 'users#index'
  get 'users/' => 'users#index'
  post 'users/' => 'users#create'
  get 'users/new' => 'users#new', as: :newuser

  resources :posts, except: [:edit, :update, :destroy] do
  resources :comments, only: :create
  end
end
