class PagesController < ApplicationController
	def index
		@posts = current_user.feed if user_signed_in?
	end

	def about_us
	end

	def terms_of_use
	end
end