Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#gateway'
  post 'static_pages/check_password'
end
