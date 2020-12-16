Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root "products#index"
  resources :products do
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
end
