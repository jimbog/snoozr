Rails.application.routes.draw do
  
  # root 'static_pages#home'
  root "users#index"

  get "/signup" => "users#new"
  resources :users, only: [:index, :show, :create]

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :posts do
  resources :comments, only: :create
  end
  
end
