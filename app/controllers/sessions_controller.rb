class SessionsController < ApplicationController
  def login
  	render 'login'
  end

  def new_session
  	authorized_user = User.auth(params[:user_credential],params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome #{authorized_user.username.humanize}"
      redirect_to(controller: 'projects', action: 'index')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end

  def logout
  	session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
