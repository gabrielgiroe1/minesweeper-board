Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'boards#new'
  get '/boards', to: 'boards#index', as: 'boards'
  post '/boards', to: 'boards#create'
  get '/boards/:id', to: 'boards#show', as: 'board'
end
