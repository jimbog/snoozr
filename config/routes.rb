Rails.application.routes.draw do
  
  # root 'static_pages#home', as: :something "something" becomes a variable
  root 'static_pages#home'

  resources :users
  resources :posts do
    resources :comments, only: :create
  end

  get "/signup" => "users#new"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
