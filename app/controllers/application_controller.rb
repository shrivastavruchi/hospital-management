class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    if resource.has_role? (:receptionist)
			patients_path
    elsif resource.has_role? (:doctor)  
      visits_path
    else
   		user_index_path
    end
  end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:patient_id,:age])
  end
end
