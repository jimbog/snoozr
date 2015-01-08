Rails.application.routes.draw do

  resources :users
  resources :posts do
  resources :comments, only: :create
  end
  
  root 'static_pages#home'
end
