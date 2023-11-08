require 'bcrypt'

class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user != nil
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass]
        session[:login_uid] = user.uid
        redirect_to root_path
      else
        render 'login'
      end
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
