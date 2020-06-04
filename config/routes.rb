Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :pages do
    collection do
      get :search
    end
  end

  resources :profiles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [:index, :new, :create, :show, :edit, :update] do
    resources :interactions, only: [:create, :show]
  end
  resources :trips, only: [:destroy]

  resources :interactions, only: [:destroy, :update]

  resources :interactions, only: :show do
    resources :messages, only: :create
  end

  get 'dashboard', to: 'pages#dashboard'

  resources :notifications, only: [:index]
end
