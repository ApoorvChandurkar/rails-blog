class SessionsController < ApplicationController

  def new

  end

  def create
    #obtain data form post request present in params directory
    
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "logged in successfully"
      redirect_to user

    else

      flash.now[:alert] = "There was some problem with your login details"
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end

end