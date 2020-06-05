Rails.application.routes.draw do
  resources :user_players
  resources :users
  resources :players
  resources :teams
  resources :leagues
  post "/login", to: "users#login"
  # This route is to activate the token authentication 
  get "/login", to: "users#token_authenticate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
