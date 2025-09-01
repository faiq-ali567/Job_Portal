class ApplicationController < ActionController::Base

  include Pagy::Backend

  before_action :authenticate_user!, unless: :devise_controller?
	before_action :permit_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied, with: :access_error
  
  private
  def permit_parameters
    attributes = [:name, :location, :bio, :picture, :role]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
  
  def access_error
    redirect_to root_path
  end

end
