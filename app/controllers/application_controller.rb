class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
		unless current_user.try(:admin?)
			flash[:error] = "Permissão Negada"
			redirect_to '/'
		end
	end
end
