Rails.application.routes.draw do
  get "feed", to: "feed#index", as: :feed

  root "feed#index"

  devise_for :users

  resources :users, only: [ :index, :show ]

  resources :relationships, only: [ :create, :destroy ]

  resources :posts, only: [ :create, :show, :destroy ]

  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  resources :posts do
    resources :likes, only: [ :create, :destroy ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
