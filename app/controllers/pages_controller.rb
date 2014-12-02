class PagesController < ApplicationController
	def welcome
		#TODO implementar ranking nessa ação neste controller
		@posts = current_user.feed if user_signed_in?
	end

	def about
	end

	def terms_of_use
	end
end