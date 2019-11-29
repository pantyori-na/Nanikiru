class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:introduction])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:dan_3p_proper])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:dan_4p_proper])
  end
end