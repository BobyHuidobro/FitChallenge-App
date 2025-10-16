class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permitir username y role en el registro
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
    # Permitir username y role en la actualización de cuenta
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role])
  end
end
