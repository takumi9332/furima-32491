Rails.application.routes.draw do
  devise_for :users
  root "products#index.html.erb"
  resources :products, only: :new
end
