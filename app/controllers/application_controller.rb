class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protected

    def configure_permitted_parameters
      added_attrs = [ :email, :name, :department, :wage, :password, :password_confirmation ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
