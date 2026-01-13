Rails.application.routes.draw do
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  get 'guide', to: 'static_pages#guide'
  
#if Rails.env.production?
#  get '/seed', to: 'seed#run'
#end

  devise_for :users,controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root 'top#index'
  get 'choices/new', to: 'choices#new', as: 'new_choice'
  get 'dishes', to: 'dishes#index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :dishes, only: [:index] 
  resources :choices, only: [:create, :index]
  resources :posts
  resources :users, only: [:show]
end