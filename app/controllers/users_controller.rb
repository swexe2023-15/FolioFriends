class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard]

  def dashboard
    @favorite_books = @user.likes.map do |like|
      GoogleBooksApiClient.book_details(like.book_api_id)
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to top_login_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  def user_params
    params.require(:user).permit(:name, :password)
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
