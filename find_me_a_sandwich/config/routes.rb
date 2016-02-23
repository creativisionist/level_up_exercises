Rails.application.routes.draw do
  devise_for :users

  resources :merchants, only: [:index, :show]

  resources :users, only: [:index, :show]
  resource :profile, only: [:show, :edit, :update], controller: "users"

  get "favorites" => "users#favorites"
  post "favorites" => "menu_items_user#mark_as_favorite"
  delete "unfavorite" => "menu_items_user#unfavorite_item"

  root "home#index"
end
