Rails.application.routes.draw do
  resources :volumes, only: [:index, :show] do
    resources :issues, only: [:index, :show]
  end

  get 'my_library', to: 'libraries#show', as: :library
  resource :libraries, only: [:create, :destroy]

  devise_for :users

  root 'libraries#show'
end
