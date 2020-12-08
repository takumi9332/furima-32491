Rails.application.routes.draw do
  devise_for :users
  root "items#index.html.erb"
end
