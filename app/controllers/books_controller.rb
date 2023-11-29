class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = GoogleBooksApiClient.search_books(params[:query])
    else
      @books = GoogleBooksApiClient.search_books('Ruby on Rails', lang: 'ja')
    end
  end
end
