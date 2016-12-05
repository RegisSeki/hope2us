Rails.application.routes.draw do
  root 'home#index'
  resources :donations, only: [:index, :create]
end
