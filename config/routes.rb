Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :donations, only: [:new, :create] do
    collection do
      get 'confirmation', to: 'confirmation#index'
    end
  end
end
