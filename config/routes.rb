Rails.application.routes.draw do
  get 'history/index'
  get 'history/create'
  get 'likes/create'
  get 'likes/destroy'
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/destroy'
  get 'bookshelves/index'
  get 'bookshelves/new'
  get 'bookshelves/create'
  get 'bookshelves/update'
  get 'bookshelves/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  get 'top/login'
  get 'top/logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
