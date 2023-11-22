class LikesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    unless book.liked?(current_user)
      book.like(current_user)
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(book_id: params[:book_id], user_id: current_user.id)
    like.destroy if like
    redirect_to root_path
  end
end
