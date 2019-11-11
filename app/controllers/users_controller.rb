class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
    parmas.require(:user).permit(:name, :email, :password, :avatar)
  end
end
