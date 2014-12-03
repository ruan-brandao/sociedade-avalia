class PagesController < ApplicationController
	def ranking
		#TODO implementar ranking nessa ação neste controller
		@politicians = User.where(politician: true)
		@ranking = @politicians.map { |u|
			{ id: u.id, proportion: u.likes_percentage }
		}.sort_by { |r| r[:proportion] }.reverse
		@users = []
		@ranking.each { |u| @users << User.find(u[:id]) }
	end

	def about
	end

	def terms_of_use
	end
end