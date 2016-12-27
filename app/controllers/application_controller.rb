class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone_number, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone_number, :role])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :email, :phone_number, :role])    
  end

  def verify_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
