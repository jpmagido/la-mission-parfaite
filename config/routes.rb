Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  namespace :administration do
    resources :passwords, only: [:edit, :update, :show, :index]
    get 'dashboard', to: 'administrations#dashboard'
  end

  resources :cities, only: [:show, :index, :edit, :update]
  resources :restaurants, only: [:show, :index]
  resources :housings, only: [:show, :index]

  root 'gateways#user'

  get 'static_pages/home'
  get 'static_pages/refund'

  get 'gateways/user'
  get 'gateways/admin'
  post 'gateways/check_password'
  post 'gateways/disconnect'

  get 'unauthorized', to: 'errors#unauthorized_401'
end
