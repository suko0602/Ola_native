class ProfilesController < ApplicationController
  before_action :set_profile, only: %i(show)
  def show
  end
  
  def edit 
    @profile = current_user.profile
  end 
  
  def update
    @profile = ProfileForm.new
    if @profile.update(account_update_params)
      redirect_to profile_path(@profile), notice: "#{User.profile.name}のプロフィールを変更しました。"
    else 
      render :edit  
    end 
  end

  private

    def set_profile 
      @profile = current_user.profile
    end

    def account_update_params
      params.require(:profile).permit(:avatar, :remove_avatar, :name, :introduction, :native_language_id, :learning_language_id, :interest_country_id, :well_known_country_id)
    end 
end
