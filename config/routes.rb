Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]

  resources :posts, only: [:create, :show, :destroy]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
