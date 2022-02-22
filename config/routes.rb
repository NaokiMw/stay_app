Rails.application.routes.draw do
  get 'reserves/index'
  get 'registers/index'
  get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :registers
  resources :users

  resources :users do
    resources :registers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
