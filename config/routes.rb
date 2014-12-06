Rails.application.routes.draw do
  resources :volumes, only: [:index, :show]
  resources :issues, only: [:index, :show]

  devise_for :users

  root to: 'volumes#index'
end
