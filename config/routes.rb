Rails.application.routes.draw do
  resources :volumes, only: [:index, :show] do
    resources :issues, only: [:index, :show]
  end

  devise_for :users

  root to: 'volumes#index'
end
