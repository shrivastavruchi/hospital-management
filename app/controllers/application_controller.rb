class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #cancan message
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to visits_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    if resource.has_role? (:admin)
      user_index_path
    else   
      dashboard_path
    end
  end


  

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:patient_id,:age])
  end
end
