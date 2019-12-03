class ProfilesController < ApplicationController
  before_action :set_profile, only: %i(show)

  def show
  end
  
  def edit 
    @user = current_user.profile
  end 
  
  def update
    if current_user.update(account_update_params)
      redirect_to profile_path(current_user), notice: "#{current_user.name}のプロフィールを変更しました。"
    else 
      render :edit  
    end 
  end

  private

    def set_profile 
      @user = User.find(params[:id])
    end

    def account_update_params
      params.require(:profile).permit(:name, :avatar, :avatar_cache, :remove_avatar, :introduction, :native_language_id, :learning_language_id, :interest_country_id, :well_known_country_id)
    end 
end
