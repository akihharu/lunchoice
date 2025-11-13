Rails.application.routes.draw do
  
  devise_for :users
  root 'top#index'
  get 'choices/new', to: 'choices#new', as: 'new_choice'
  get 'dishes', to: 'dishes#index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :dishes, only: [:index] 
  resources :choices, only: [:create]
end