Rails.application.routes.draw do
  root "events#index"
  resources :users

  resources :users, only: [:show, :edit, :update]
  resources :events
end
