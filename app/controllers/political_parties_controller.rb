class PoliticalPartiesController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	private

	def set_political_party
		@political_party = PoliticalParty.find(params[:id])
	end
end
