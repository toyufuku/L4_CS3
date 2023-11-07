class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render "main"
    else
      render "login"
    end
  end

  def login
    uid = params[:uid]
    password = params[:password]

    users = User.find_by(uid: params[:uid]) and User.find_by(pass: params[:pass])

    if users && users.authenticate(password)
      session[:login_uid] = uid
      redirect_to top_main_path, notice: 'ログイン成功'
    else
      flash[:error] = 'ログイン失敗'
      render 'login'
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end
