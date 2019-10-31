class ProfilesController < ApplicationController

  def show
  end

  def edit
  end

  def update
    if current_user.update(account_update_params)
      flash[:notice] = "プロフィールを変更しました。 "
      redirect_to profile_path(current_user)
    else 
      render edit_profile_path 
    end 
  end

  def account_update_params
    params.require(:user).permit(:name, :avatar)
  end 
end
