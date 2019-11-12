Rails.application.routes.draw do
  resources :moves
  resources :battles
  resources :battlefields
  resources :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "battlefields#index"
  get "/login", to: "sessions#new"
  post "sessions/create"
  delete "/logout", to: "sessions#destroy"
end
