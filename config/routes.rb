Rails.application.routes.draw do
  # Create routes for Recipes
  resources :recipes

  # Create routes for Chef
  resources :chefs, except: [:new]
  get '/signup', to: 'chefs#new'
  root 'pages#home'

  get 'pages/home', to: 'pages#home'

  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  
end
