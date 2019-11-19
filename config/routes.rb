Rails.application.routes.draw do
  # resources :moves
  resources :battlefields do
    resources :battles
  end
  resources :players, except: :destroy

  root to: "battlefields#index"
  get "/login", to: "sessions#new"
  post "sessions/create"
  delete "/logout", to: "sessions#destroy"

  mount ActionCable.server => "/cable"
end
