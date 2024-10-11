class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
