class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def oauthcreate
    auth = request.env["omniauth.auth"]

    #いれば取得、いなければ作成
    user = User.find_by(email: auth["info"]["email"]) 
    if user 
      sign_in user
      redirect_back_or user
    else #通常ログイン
      user = User.new(name: auth["info"]["name"], email: auth["info"]["email"], password: auth["uid"], password_confirmation: auth["uid"])
      #OAuth時はパスワード必須回避
      if user.save(context: :oauth_login)
        flash[:success] = "Welcome to the sFANS PRESS!"
        #redirect_to user
        sign_in user
        redirect_back_or user
      else
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
