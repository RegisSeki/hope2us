Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :donations, only: [:new, :index, :create, :destroy] do
    collection do
      get 'confirmation', to: 'confirmation#index'
    end

    member do
    	get 'receipt/edit',
          to: 'donation_receipts#edit',
          as: :edit_receipt_donation
    end

    get 'receipt', to: 'donation_receipts#show'
    put 'receipt', to: 'donation_receipts#update'
  end
end
