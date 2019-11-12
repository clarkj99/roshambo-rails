Rails.application.routes.draw do
  resources :moves
  resources :battles
  resources :battlefields
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "battlefields#index"
  get "/players/new"
  get "/players", to: "players#show"
  post "/players", to: "players#create"
  get "/login", to: "sessions#new"

  post "sessions/create"
  delete "/logout", to: "sessions#destroy"
end
