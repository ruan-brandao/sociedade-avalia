class MockupsController < ApplicationController
	def index
		flash[:alert] = "This is an alert"
		flash[:notice] = "This is a notice"
	end
end