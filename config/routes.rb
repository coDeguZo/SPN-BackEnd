Rails.application.routes.draw do
  resources :user_players
  resources :users
  resources :players
  resources :teams
  resources :leagues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
