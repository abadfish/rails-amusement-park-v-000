class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "User created."
    else
      flash[:alert] = "Unable to save! Try again."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :tickets, :height, :admin)
  end
end
