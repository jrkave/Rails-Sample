class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :destroy, :create] # skip require_login for new, create, and destroy actions 

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid name or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to root_url, notice: 'Logged out successfully'
  end
  
end
