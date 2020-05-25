Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profile, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :review, only: [:index, :new, :create, :edit, :update]
  end

  resources :review, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
