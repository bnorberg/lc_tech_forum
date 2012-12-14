LcTechForum::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  resources :users
  resources :sessions

  root to: 'posts#index'
  resources :comments
  match "/auth/:provider/callback" => "sessions#create"
  resources :posts
end
