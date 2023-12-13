class TopController < ApplicationController
  def main
  end
  
  def login
    user = User.find_by(name: params[:name])
    if user != nil
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:password]
        session[:login_uid] = user.id
        redirect_to root_path
      else
        flash.now[:alert] = 'ユーザーネームまたはパスワードが不正です'
        render "login"
        
      end
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
