class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_permitted_parameters, if:  :devise_controller?
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
