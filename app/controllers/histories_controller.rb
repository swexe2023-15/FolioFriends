class HistoriesController < ApplicationController
  def index
    @histories = current_user.histories
  end

  def create
    response = { status: 'error', message: '履歴の追加に失敗しました。' }
    
    unless History.exists?(book_api_id: params[:book_api_id], user_id: current_user.id)
      history = current_user.histories.build(history_params)
      if history.save
        add_book_to_history(history.book_api_id, current_user)
        response = { status: 'success', message: '履歴に追加されました。' }
      end
    end
    render json: response
  end

  private
  
  def add_book_to_history(book_api_id, user)
    history_shelf = user.history_shelf
    unless history_shelf.book_api_ids.include?(book_api_id)
      history_shelf.book_api_ids << book_api_id
      history_shelf.save
    end
  end

  def history_params
    params.permit(:book_api_id)
  end
end
