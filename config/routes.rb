Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:index, :new, :create, :edit, :update]
  end

  resources :reviews, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :interactions, only: [:show, :destroy]
  end
end
