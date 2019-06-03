Rails.application.routes.draw do

  resources :recipes
  root 'pages#home'

  get 'pages/home', to: 'pages#home'
  get '/recipes', to: 'recipes#index'
end
