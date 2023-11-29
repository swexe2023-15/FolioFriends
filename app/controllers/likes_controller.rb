class LikesController < ApplicationController
  def create
    unless Like.exists?(book_api_id: params[:book_api_id], user_id: current_user.id)
      Like.create(book_api_id: params[:book_api_id], user_id: current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(book_api_id: params[:book_api_id], user_id: current_user.id)
    like.destroy if like
    redirect_to root_path
  end
end
