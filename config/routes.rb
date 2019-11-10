Rails.application.routes.draw do
  resources :moves
  resources :battles
  resources :battlefields
  devise_for :players
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "battlefields#index"
end
