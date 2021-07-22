Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :homes, only: [:index] #do
  #   collection do
  #     get 'search'
  #   end
  # end
  resources :customers
  resources :products #do
  #   collection do
  #     get 'search'
  #   end
  # end
  devise_for :users
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  get 'tops/index'
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
