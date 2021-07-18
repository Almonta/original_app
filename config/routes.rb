Rails.application.routes.draw do
  # get 'homes/index'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  resources :customers
  resources :products
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  get 'tops/index'
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
