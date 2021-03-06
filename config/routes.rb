# == Route Map
#
#                   Prefix Verb   URI Pattern                              Controller#Action
#            volume_issues GET    /volumes/:volume_id/issues(.:format)     issues#index
#             volume_issue GET    /volumes/:volume_id/issues/:id(.:format) issues#show
#                  volumes GET    /volumes(.:format)                       volumes#index
#                   volume GET    /volumes/:id(.:format)                   volumes#show
#                  library GET    /my_library(.:format)                    libraries#show
#                libraries POST   /libraries(.:format)                     libraries#create
#                          DELETE /libraries(.:format)                     libraries#destroy
#         new_user_session GET    /users/sign_in(.:format)                 devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                devise/sessions#destroy
#            user_password POST   /users/password(.:format)                devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#                          PATCH  /users/password(.:format)                devise/passwords#update
#                          PUT    /users/password(.:format)                devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                  devise/registrations#cancel
#        user_registration POST   /users(.:format)                         devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                 devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                    devise/registrations#edit
#                          PATCH  /users(.:format)                         devise/registrations#update
#                          PUT    /users(.:format)                         devise/registrations#update
#                          DELETE /users(.:format)                         devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)            devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)        devise/confirmations#new
#                          GET    /users/confirmation(.:format)            devise/confirmations#show
#                     root GET    /                                        libraries#show
#

Rails.application.routes.draw do
  resources :volumes, only: [:index, :show] do
    resources :issues, only: [:index, :show]
  end

  get 'my_library', to: 'libraries#show', as: :library
  get 'my_library/unread', to: 'libraries#unread', as: :unread_library
  resource :libraries, only: [:create, :destroy]

  resource :readlists, only: [:create, :destroy]

  devise_for :users

  root 'libraries#show'
end
