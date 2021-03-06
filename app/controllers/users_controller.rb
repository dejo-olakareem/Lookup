class UsersController < ApplicationController
  def index
    @users =  User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_business_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def allowed_params
    params.require(:user).permit(:email, :password, :user_name, :password_confirmation,:image,:name)
  end
end
