LcTechForum::Application.routes.draw do
  resources :users


  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  resources :users
  resources :sessions

  root to: 'posts#index'
  resources :posts do
    member { post :vote }
  end
  match "/auth/:provider/callback" => "sessions#create"
  resources :comments do
    member { post :vote }
  end
end
