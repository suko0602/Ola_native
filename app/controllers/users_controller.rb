class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit)

  def user_params
    parmas.require(:user).permit(:name, :email, :password, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
