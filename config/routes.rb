# config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'financial_records#index', as: :authenticated_root
    resources :financial_records
  end

  devise_scope :user do
    root to: "devise/sessions#new" # Use devise/sessions#new as the root for unauthenticated users
    delete 'sign_out', to: 'devise/sessions#destroy' # No need to explicitly name it
  end
end
