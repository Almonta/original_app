Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'tops#index'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  resources :homes, only: [:index]
  resources :products, except: [:index] do
    resources :product_contacts, only: %i[create edit update destroy]
    resources :product_documents
    # resources :product_documents, shallow: true
    # resources :documents, shallow: true
  end
  resources :customers, except: [:index] do
    resources :customer_contacts, only: %i[create edit update destroy]
    resources :customer_documents
    resources :schedules
  end
  resources :registered_projects, only: [:index]
  resources :user_products, only: %i[create destroy]
  resources :user_customers, only: %i[create destroy]
  resources :users, only: [:show]
end
