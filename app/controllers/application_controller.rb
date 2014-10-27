class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def require_admin
		unless current_user.try(:admin?)
			flash[:error] = "Permissão Negada"
			redirect_to '/'
		end
	end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :birth_date, :gender, :city, :state, 
							 :username, :email, :password, :password_confirmation,
							 :profile_picture, :political_party_id)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :birth_date, :gender, :city, :state, 
							 :username, :email, :password, :password_confirmation,
							 :profile_picture, :political_party_id)
    end
  end
end
