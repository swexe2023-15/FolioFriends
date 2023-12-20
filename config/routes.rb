Rails.application.routes.draw do
  root 'top#main'

  get 'login', to: 'top#login'
  post 'login', to: 'top#login'
  get 'logout', to: 'top#logout'

  resources :users, only: [:new, :create, :destroy] do
    member do
      get 'dashboard'
    end
  end

  resources :bookshelves, except: [:show]
  post 'add_book_to_shelf', to: 'bookshelves#add_book'
  get 'public_bookshelves', to: 'bookshelves#public_bookshelves'

  resources :books, only: [:index]

  resources :likes, only: [:create, :destroy, :index]

  resources :histories, only: [:index, :create]
end
