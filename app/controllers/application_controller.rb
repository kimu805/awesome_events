class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path, alert: "ログインが必要です"
    end
  end
end
