class PagesController < ApplicationController
	def welcome
		@posts = current_user.feed if user_signed_in?
	end

	def about
	end

	def terms_of_use
	end
end