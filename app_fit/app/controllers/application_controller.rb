class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to access this page."
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permitir username y role en el registro
    # Permitimos username but NOT role (role must be assigned by admins only)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # Permitir username en la actualización de cuenta (no role)
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
