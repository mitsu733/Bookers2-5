Rails.application.routes.draw do
  root "home#home"
  get "about" => "home#about", as: "home_about"
  devise_for :users
   resources :users, only:[:new, :create, :index, :show, :edit, :update ]
  resources :books do
   	resource :favorites, only:[:create, :destroy]
   end
  resources :book_comments, only:[:create, :destroy]
  resources :relationships, only: [:create, :destroy, :show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end