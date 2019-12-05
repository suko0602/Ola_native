class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: %i(create)
  before_action :configure_account_update_params, only: %i(create)

  def create 
    super
    resource.build_profile
    resource.save 
  end 

  def after_sign_up_path_for(resource)
    edit_profile_path(@profile)
  end

  protected
  
    def configure_sign_up_params 
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    end
end 
