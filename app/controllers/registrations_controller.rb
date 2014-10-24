class RegistrationsController < Devise::RegistrationsController

	def update
		account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

		if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
	end

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, 
																 :city, :state, :username, :email, :password, 
																 :password_confirmation,
																 :profile_picture, :political_party_id)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :birth_date, :gender, 
																 :city, :state, :username, :email, :password, 
																 :password_confirmation,
																 :profile_picture, :political_party_id)
	end
end