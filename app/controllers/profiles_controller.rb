class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(account_update_params)
      redirect_to profile_path(current_user), notice: "#{current_user.name}のプロフィールを変更しました。"
    else 
      render :edit  
    end 
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar, :introduction)
  end 
end
