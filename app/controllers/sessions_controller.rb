class SessionsController < ApplicationController
  def new
  end
  def index
    render 'new'
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_business_path(user)
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
