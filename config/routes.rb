Rails.application.routes.draw do
  resources :user_bookmarks
  resources :user_teams
  resources :user_players
  resources :users
  resources :players
  resources :teams
  resources :leagues
  resources :home_news

  post '/teams/:id', to: "teams#team_profile"
  post "/login", to: "users#login"
  # This route is to activate the token authentication 
  get "/login", to: "users#token_authenticate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
