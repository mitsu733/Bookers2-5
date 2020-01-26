Rails.application.routes.draw do
  root "home#home"
  get "about" => "home#about", as: "home_about"
  devise_for :users
  resources :books
  resources :users, only:[:new, :create, :index, :show, :edit, :update ]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end