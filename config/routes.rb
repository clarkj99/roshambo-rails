Rails.application.routes.draw do
  get "ac_test/", to: "ac_test#index", as: "ac_messages"
  post "ac_test/", to: "ac_messages#create"
  resources :moves
  resources :battlefields do
    resources :battles
  end
  resources :players

  root to: "battlefields#index"
  get "/login", to: "sessions#new"
  post "sessions/create"
  delete "/logout", to: "sessions#destroy"

  mount ActionCable.server => "/cable"
end
