class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username bio email password photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username bio email password photo])
  end
end
