class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone, if: :current_user
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone_number, :roles])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone_number, :roles])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :email, :phone_number, :roles])    
  end

  def verify_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
