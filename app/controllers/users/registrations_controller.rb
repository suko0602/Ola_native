# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  def new 
    @user = User.new 
    @profile = @user.build_profile
  end

  def update
    if current_user.update(account_update_params)
        redirect_to mypage_path(current_user), notice: 'プロフィールを更新しました'
    else
      render :edit_profile
    end
  end 
  
  def after_sign_up_path_for(resource)
    edit_profile_user_path(current_user)
  end

  protected
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end 
