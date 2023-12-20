class BookshelvesController < ApplicationController
  def index
    @bookshelves = current_user.bookshelves
    @books = {}
    @bookshelves.each do |shelf|
      @books[shelf.id] = shelf.book_api_ids.map do |api_id|
        response = GoogleBooksApiClient.book_details(api_id)
        response
      end
    end
  end

  def new
    @bookshelf = Bookshelf.new
  end

  def create
    @bookshelf = current_user.bookshelves.new(bookshelf_params)
    if @bookshelf.save
      redirect_to bookshelves_path
    else
      logger.debug @bookshelf.errors.full_messages
      render 'new'
    end
  end

  def edit
    @bookshelf = Bookshelf.find(params[:id])
  end

  def update
    @bookshelf = Bookshelf.find(params[:id])
    if @bookshelf.update(bookshelf_params)
      redirect_to bookshelves_path(@bookshelf)
    else
      render 'edit'
    end
  end

  def destroy
    bookshelf = Bookshelf.find(params[:id])
    bookshelf.destroy
    redirect_to bookshelves_path
  end

  def add_book
    shelf = current_user.bookshelves.find(params[:shelf_id])
    shelf.book_api_ids << params[:book_api_id]
    if shelf.save
      redirect_to bookshelves_path, notice: '本が本棚に追加されました。'
    else
      redirect_to books_path, alert: '本を本棚に追加できませんでした。'
    end
  end

  def public_bookshelves
    @public_bookshelves = Bookshelf.where(is_public: true).includes(:user)
    @books = {}
    @public_bookshelves.each do |shelf|
      @books[shelf.id] = shelf.book_api_ids.map do |api_id|
        GoogleBooksApiClient.book_details(api_id)
      end
    end
  end
  
  private

  def add_book_to_shelf(book_api_id, shelf)
    unless shelf.book_api_ids.include?(book_api_id)
      shelf.book_api_ids << book_api_id
      shelf.save
    end
  end

  def bookshelf_params
    params.require(:bookshelf).permit(:shelfname, :is_public)
  end
end
