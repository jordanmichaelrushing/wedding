Rails.application.routes.draw do
  root to: 'passwords#index'
  get '/index', to: 'static_pages#index'
  post '/password_protected', to: 'passwords#verify'
end
