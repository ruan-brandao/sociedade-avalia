class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, :city, :state, 
																 :username, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, :city, :state, 
																 :username, :email, :password, :password_confirmation)
	end
end