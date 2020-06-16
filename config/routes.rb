Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "memes#index"

  resources :memes, :comments, :users

  resources :favourites, only: [:index, :create, :destroy]

  resources :votes, only: [:create]

  get "top-memes", to: "memes#top_memes", as: "top_memes"

  get "random-meme", to: "memes#random_meme", as: "random_meme"

  get "users/:id/comments", to: "users#comments", as: "user_comments"
end
