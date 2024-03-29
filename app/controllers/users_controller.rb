class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
