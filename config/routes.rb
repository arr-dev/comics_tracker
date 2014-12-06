Rails.application.routes.draw do
  resources :volumes, only: [:index, :show]

  devise_for :users
end
