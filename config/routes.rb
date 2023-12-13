Rails.application.routes.draw do
  root 'top#main' # test
  resources :users, only: [:new, :create, :destroy]
  resources :books, only: [:index]
  resources :bookshelves, only: [:index, :new, :create, :update, :destroy]
  
  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
