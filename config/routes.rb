Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create]

  resources :games, only: [:index, :show]

  resources :favourites, only: [:create, :destroy]
end
