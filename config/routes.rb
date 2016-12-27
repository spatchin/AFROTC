Rails.application.routes.draw do
  get '/cadet_area', to: 'cadet_area#index', as: 'cadet_area'

  devise_for :users
  resources :users
  resources :events

  get '/:page', to: 'pages#show', as: 'pages'
  root 'pages#show', page: 'home'
end
