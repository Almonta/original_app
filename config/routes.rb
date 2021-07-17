Rails.application.routes.draw do
  resources :customers
  resources :products
  devise_for :users
  get 'tops/index'
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
