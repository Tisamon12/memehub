Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "memes#index"

  resources :memes, :comments, :users

  resources :favourites, only: [:index, :create, :destroy]

  get "users/:id/comments", to: "users#comments", as: "user_comments"
end
