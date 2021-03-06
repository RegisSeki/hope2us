Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  devise_for :admin_users

  namespace :admin do
   resources :items, only: [:index]
   resources :donations, only: [:index, :show] do
     member do
      post 'approve'
      post 'confirm'
     end
   end
  end

  resources :donations, only: [:new, :index, :create] do
    collection do
      get 'confirmation', to: 'confirmation#index'
    end

    member do
    	get 'receipt/edit', to: 'donation_receipts#edit', as: :edit_receipt
      get 'receipt', to: 'donation_receipts#show'
      put 'receipt', to: 'donation_receipts#update'
      post 'cancel', to: 'donations#cancel'
    end
  end
end
