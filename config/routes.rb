Rails.application.routes.draw do
  root 'static_pages#gateway'

  get 'static_pages/home'
  get 'static_pages/gateway'

  post 'static_pages/check_password'
  post 'static_pages/disconnect'
end
