Rails.application.routes.draw do
  get '/cadet_area', to: 'cadet_area#index', as: 'cadet_area'

  get '/:page', to: 'pages#show', as: 'pages'
  root 'pages#show', page: 'home'
  devise_for :users
  resources :users
end
