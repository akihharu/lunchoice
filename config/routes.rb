Rails.application.routes.draw do
  
  # 1. ユーザー認証機能 (mainブランチの変更)
  devise_for :users
  
  # 2. 料理一覧画面のルーティング (タスク #18で使用、categoriesを受け取る)
  resources :dishes, only: [:index] 

  # 3. 選択画面のルーティング (タスク #14)
  get 'choices/new', to: 'choices#new', as: 'new_choice' 

  # 4. トップページ
  root 'top#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end