Rails.application.routes.draw do
  resources :mahasiswas
  resources :mata_kuliahs
  resources :prodis
  devise_for :users, controllers: {sessions: "users/sessions"}

  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
