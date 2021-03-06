Rails.application.routes.draw do
  # Create routes for Recipes
  resources :recipes

  # Create routes for Chef
  resources :chefs, except: [:new]

  #Create Routes for Ingredients
  resources :ingredients, except: [:destroy]

  # Create Routes for Signup
  get '/signup', to: 'chefs#new'

  # Reset Password
  get 'forgot_passwords', to: 'forgot_passwords#new'
  resources :forgot_passwords,  only: [:create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  resources :password_resets,   only: [:show, :create]
  get 'expired_token', to: 'password_resets#expired_token'



  # Set the Default Homepage
  root 'pages#home'
  get 'pages/home', to: 'pages#home'

  # Create Login and Log Out Routes
  get     '/login',     to: 'sessions#new'
  post    '/login',     to: 'sessions#create'
  delete  '/logout',    to: 'sessions#destroy'
  # get '/recipes', to: 'recipes#index'
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  
end
