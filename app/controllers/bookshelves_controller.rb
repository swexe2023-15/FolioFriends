class BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.all
  end

  def new
    @bookshelf = Bookshelf.new
  end

  def create
    @bookshelf = current_user.bookshelves.new(bookshelf_params)
    if @bookshelf.save
      redirect_to bookshelves_path
    else
      render 'new'
    end
  end

  def update
    @bookshelf = Bookshelf.find(params[:id])
    if @bookshelf.update(bookshelf_params)
      redirect_to bookshelf_path(@bookshelf)
    else
      render 'edit'
    end
  end

  def destroy
    bookshelf = Bookshelf.find(params[:id])
    bookshelf.destroy
    redirect_to bookshelves_path
  end
  
  private

  def bookshelf_params
    params.require(:bookshelf).permit(:shelfname)
  end
end
