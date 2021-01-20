Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
