class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]
    if user.nil? or not user.authenticate params[:password]
      redirect_to :back, notice: "Username and password do not match!"
    else
      session[:user_id] = user.id
      redirect_to :root, notice: "Welcome back!"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to :root, notice: "You have successfully logged out."
  end
end