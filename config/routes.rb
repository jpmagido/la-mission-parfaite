Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  root 'gateways#user'
  get 'static_pages/home'

  get 'gateways/user'
  get 'gateways/admin'
  post 'gateways/check_password'
  post 'gateways/disconnect'
end
