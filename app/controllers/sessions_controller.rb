class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new,:create]
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Logged in successfully."
        redirect_to root_path
      else
        flash.now[:error] = "Password is incorrect."
        render 'new'
      end
    else
      flash.now[:error] = "Username is incorrect."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to login_path
  end

  private   

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in."
      redirect_to root_path
    end
  end
  
end
