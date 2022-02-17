class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    respond_to :json
  
    before_action :underscore_params!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user
    
private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end 

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

end
