class HistoryController < ApplicationController
  def index
    @histories = current_user.histories
  end

  def create
    response = { status: 'error', message: '履歴の追加に失敗しました。' }
    
    unless History.exists?(book_api_id: params[:book_api_id], user_id: current_user.id)
      history = current_user.histories.build(history_params)
      if history.save
        response = { status: 'success', message: '履歴に追加されました。' }
      end
    end
    render json: response
  end

  private

  def history_params
    params.permit(:book_api_id)
  end
end
