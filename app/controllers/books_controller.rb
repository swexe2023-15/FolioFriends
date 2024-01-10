class BooksController < ApplicationController
  def index
    @books = GoogleBooksApiClient.search_books(params[:query])
  end
end