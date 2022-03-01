Rails.application.routes.draw do
  get 'users/show' => "users#show"
  get 'reserves/index'
  get 'registers/index'
  get 'home/index'
  get 'registers/search'
  post 'reserves/confirm' # 確認画面
  post 'reserves/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  post 'reserves/complete'
  post 'reserves/show'

  devise_for :users
  root to: 'home#index'

  resources :registers

  resources :users
  resources :reserves

  resources :users do
    resources :registers
  end


  resources :registers do
    resources :reserves
    post 'confirm'
    post 'back'
    post 'complete'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
