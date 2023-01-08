Rails.application.routes.draw do
  resources :users

  resources :users, only: [:show, :edit, :update]
  resources :events
end
