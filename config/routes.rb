Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
  resources :comments
  resources :purchases
  end
  resources :users, only: :show
end
