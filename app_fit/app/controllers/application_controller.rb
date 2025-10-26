class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permitir solo username en el registro (antes dejaba elegir rol de admin)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # Permitir username en la actualización de cuenta por defecto (que solo pueda hacer update de su username, no de su rol)
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

    # Permitir role en account_update SOLO si el usuario actual es admin
    if current_user&.role == 'admin'
      devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end
  end
end