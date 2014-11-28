class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to categories_path, notice: "Logged In!"
    else
      flash.now.alert "Invalid Email or Password"
      redirect_to "new"
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged Out!"
  end
end