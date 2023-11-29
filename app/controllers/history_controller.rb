class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def create
    unless History.exists?(book_api_id: params[:book_api_id], user_id: current_user.id)
      history = History.new(history_params)
      if history.save
        redirect_back
      else
        redirect_back
      end
    else
      redirect_back
    end
  end

  private

  def history_params
    params.permit(:book_api_id).merge(user_id: current_user.id)
  end
end
