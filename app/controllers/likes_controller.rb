class LikesController < ApplicationController
  def index
    @liked_books = current_user.likes.map do |like|
      GoogleBooksApiClient.book_details(like.book_api_id)
    end
  end
  
  def create
    unless Like.exists?(book_api_id: params[:book_api_id], user_id: current_user.id)
      like = Like.create(book_api_id: params[:book_api_id], user_id: current_user.id)
      add_book_to_favorites(like.book_api_id, current_user)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(book_api_id: params[:book_api_id], user_id: current_user.id)
    like.destroy if like
    redirect_back(fallback_location: root_path)
  end

  private

  def add_book_to_favorites(book_api_id, user)
    favorite_shelf = user.favorite_shelf
    favorite_shelf.book_api_ids << book_api_id
    favorite_shelf.save
  end
end