Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :donations, only: [:index, :create] do
    collection do
      get 'confirmation', to: 'confirmation#index'
    end
    member do
    	get 'receipt', to: 'donation_receipts#edit'
      put 'receipt', to: 'donation_receipts#update'
    end
  end
end
